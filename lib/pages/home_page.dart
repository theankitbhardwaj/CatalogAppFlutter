import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodeJso n = jsonDecode(catalogJson);
    var productsData = decodeJson["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        builder: (ctx, store, _) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Vx.red400,
            size: 22,
            count: _cart.items.length,
            textStyle: TextStyle(fontWeight: FontWeight.bold, color: Vx.white)),
        mutations: {AddMutation, RemoveMutation},
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          margin: EdgeInsets.only(left: 32, right: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

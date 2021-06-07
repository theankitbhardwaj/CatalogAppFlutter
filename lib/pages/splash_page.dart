import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/utils/shared_preference.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    PrefConfig prefConfig = new PrefConfig();
    // TODO: implement initState
    prefConfig.checkLogin().then((login) {
      if (login) {
        Timer(
          Duration(seconds: 2),
          () => context.vxNav.clearAndPush(
            Uri.parse(MyRoutes.homeRoute),
          ),
        );
      } else {
        Timer(
          Duration(seconds: 2),
          () => context.vxNav.clearAndPush(
            Uri.parse(MyRoutes.loginRoute),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png"),
          "Catalog App".text.bold.size(22).make(),
          20.heightBox,
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}

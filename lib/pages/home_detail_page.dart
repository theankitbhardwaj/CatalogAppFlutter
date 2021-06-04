import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(
                catalog.image,
              ),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl4
                          .color(MyTheme.darkBluishColor)
                          .make(),
                      catalog.desc.text.textStyle(context.captionStyle!).make(),
                      10.heightBox,
                      "Eirmod tempor sea diam sed elitr at rebum consetetur elitr amet, consetetur ipsum sanctus voluptua ipsum, et dolor voluptua vero lorem, amet eirmod est amet amet, voluptua et sadipscing elitr consetetur dolor gubergren sanctu."
                          .text
                          .textStyle(context.captionStyle!)
                          .make()
                          .p16()
                    ],
                  ).py(40),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  MyTheme.darkBluishColor,
                ),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              child: "Add to Cart".text.make(),
            ).wh(120, 50)
          ],
        ).p32(),
      ),
    );
  }
}

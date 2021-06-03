import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.p8.color(MyTheme.creamColor).rounded.make().p16().w40(context);
  }
}

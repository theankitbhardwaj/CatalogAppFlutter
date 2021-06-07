import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/pages/cart_page.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/pages/splash_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    VxState(store: MyStore(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(
        routes: {
          "/": (_, __) => MaterialPage(child: SplashPage()),
          MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomePage()),
          MyRoutes.loginRoute: (_, __) => MaterialPage(child: LoginPage()),
          MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartPage()),
          MyRoutes.homeDetailsRoute: (uri, params) {
            return MaterialPage(
                child: HomeDetailPage(
              catalog: params,
            ));
          },
        },
      ),
    );
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class PrefConfig {
  Future checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("login") ?? false;
  }

  Future setLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("login", true);
  }
}

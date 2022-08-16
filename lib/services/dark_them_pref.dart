import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePrefs {
  static const String _darkThemePref = 'dark_theme';
  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_darkThemePref, value);
  }

//
  Future<bool> get getTheme => SharedPreferences.getInstance().then((prefs) {
        return prefs.getBool(_darkThemePref) ?? false;
      });
  //
  // Future<bool> getTheme() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool(_darkThemePref) ?? false;
  // }
}

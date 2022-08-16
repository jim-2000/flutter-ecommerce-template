import 'dart:developer';

import 'package:app/services/dark_them_pref.dart';
import 'package:flutter/cupertino.dart';

class DarkTheemProvider with ChangeNotifier {
  DarkThemePrefs _darkThemePrefs = DarkThemePrefs();
  //
  bool _isdark = false;
  //
  bool get getDark => _isdark;
  //
  set setDarkTheme(bool value) {
    _isdark = value;
    _darkThemePrefs.setDarkTheme(value);
    notifyListeners();
  }

  //

}

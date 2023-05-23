import 'dart:developer';

import 'package:app/utils/sf_utils.dart';
import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier {
  late bool _isDark;
  //
  bool get isDark => _isDark;
// constructor
  ThemeProvider() {
    _isDark = false;
    _loadFrompref();
    notifyListeners();
  }
  // set dark mode
  set setDarkMode(bool isDark) {
    _isDark = isDark;
    storeBoolToSF("isDark", isDark);
    notifyListeners();
  }

  //
  toogleTheme(bool value) {
    log(value.toString());
    _isDark = value;
    notifyListeners();
    _savetopref(_isDark);
  }

  // get current theme
  Future<bool> _loadFrompref() async {
    _isDark = await fetchBoolValuesSF('isDark');

    notifyListeners();
    return _isDark;
  }

  // save theme to pref
  _savetopref(value) async {
    await storeBoolToSF('isDark', value);
  }
}

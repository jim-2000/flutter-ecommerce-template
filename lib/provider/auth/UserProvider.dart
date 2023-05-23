import 'dart:convert';
import 'dart:developer';

import 'package:app/models/auth/userModel.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  bool isLoading = false;
  User _user = User(
    email: '',
    id: '',
    img: '',
    phone: '',
    role: '',
    username: '',
  );

  User get user => _user;
  void startLoader() {
    if (!isLoading) {
      isLoading = true;
      notifyListeners();
    }
  }

  void stopLoader() {
    if (isLoading) {
      isLoading = false;
      notifyListeners();
    }
  }

  //
  void setUser(String user) {
    startLoader();
    _user = User.fromJson(json.decode(user));
    stopLoader();
    notifyListeners();
  }

  void setUserFromModel(User user) {
    startLoader();
    _user = user;
    startLoader();
    notifyListeners();
  }
}

import 'dart:developer';

import 'package:app/models/enums/paymentEnums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/utils/toast_utils.dart';
import 'package:app/utils/validation_utils.dart';

class AppController extends GetxController {
  static AppController to = Get.find();

  PaymentType _selectedPayment = PaymentType.cod;

  TextEditingController username = TextEditingController(),
      shopAddressTEC = TextEditingController(),
      shopLocationTEC = TextEditingController(),
      shopNameTEC = TextEditingController(),
      phoneNumberTEC = TextEditingController(),
      firstNameTEC = TextEditingController(),
      lastNameTEC = TextEditingController(),
      emailTEC = TextEditingController(),
      passwordTEC = TextEditingController(),
      addressTEC = TextEditingController();

  String appName = 'EasyShop';
  String welcomeText = "Welcome!";

  PaymentType get selectedPayment => _selectedPayment;

  @override
  void onInit() {
    welcomeText = "Welcome to $appName";
    log(welcomeText);
    super.onInit();
  }
}

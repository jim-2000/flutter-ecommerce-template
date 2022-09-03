import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AppModalBottomSheet {
  static appbottomshet(
    Widget widget,
    double hieght,
  ) async {
    return await showMaterialModalBottomSheet(
      context: Get.context!,
      builder: (ctx) => SizedBox(
        height: Get.height / hieght,
        child: widget,
      ),
    );
  }

  static showDialoge({
    required String title,
    required String description,
    VoidCallback? onpress,
    String? buttonTitle,
  }) {
    return Alert(
      context: Get.context!,
      type: AlertType.error,
      title: title.toUpperCase(),
      desc: description,
      buttons: [
        DialogButton(
          color: Colors.greenAccent,
          onPressed: onpress ?? () => Get.back(),
          width: 120,
          child: Text(
            buttonTitle ?? "ok",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
}

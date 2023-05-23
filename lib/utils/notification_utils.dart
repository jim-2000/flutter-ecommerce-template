import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snack({
  required String title,
  required String msg,
  IconData icon = Icons.check,
  Color iconColor = Colors.green,
  double iconSize = 30,
  Color bgColor = Colors.black,
  Color textColor = Colors.white,
  int seconds = 5,
  String? actionLabel,
  SnackPosition position = SnackPosition.TOP,
  VoidCallback? onActionTap,
}) {
  Get.snackbar(
    title,
    msg,
    shouldIconPulse: true,
    icon: Icon(
      icon,
      color: iconColor,
      size: iconSize,
    ),
    backgroundColor: bgColor,
    colorText: textColor,
    duration: Duration(
      seconds: seconds,
    ),
    snackPosition: position,
    dismissDirection: DismissDirection.horizontal,
    mainButton: actionLabel != null
        ? TextButton(
            child: Text(
              actionLabel,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              onActionTap!();
            })
        : null,
  );
}

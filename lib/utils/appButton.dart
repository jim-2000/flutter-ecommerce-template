import 'dart:ui';

import 'package:app/utils/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButton {
  Widget appTextButton(
    Color color, {
    required VoidCallback onPressed,
    required String text,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: Get.width,
        height: 55,
        decoration: BoxDecoration(
          color: AppColors.AppPrimary,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
              letterSpacing: 2,
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

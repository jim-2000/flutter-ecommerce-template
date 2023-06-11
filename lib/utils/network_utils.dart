import 'dart:async';
import 'dart:io';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/notification_utils.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/toast_utils.dart';

Future<bool> isNetOn() async {
  bool isOnline = false;
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      debugPrint('connected');
      isOnline = true;
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    debugPrint('disconnected');
    showSimpleNotification(
        msg: "Network is not available",
        color: AppColors.AppPrimary,
        title: "Turn on network connectivity");
    isOnline = false;
    return false;
  }
  return isOnline;
}

// current ip address
Future<String> getIpAddress() async {
  String ipAddress = 'Unknown';
  try {
    final List<InternetAddress> result =
        await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      ipAddress = result[0].address;
    }
  } on SocketException catch (_) {
    debugPrint('Failed to get IP address');
  }
  return ipAddress;
}

import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showAttachedToast(
    {BuildContext? context, Offset? target, required Widget widget}) {
  //Use Offset.globalposition you get from onTapDown attribute in GestureDetector widget for the 'target' value
  BotToast.showAttachedWidget(
    target: target,
    //targetContext: context,
    //verticalOffset: 0,
    //horizontalOffset: 0,
    duration: const Duration(seconds: 4),
    animationDuration: const Duration(milliseconds: 200),
    animationReverseDuration: const Duration(milliseconds: 200),
    preferDirection: PreferDirection.topCenter,
    //ignoreContentClick: false,
    //onlyOne: true,
    //allowClick: true,
    //enableSafeArea: true,
    attachedBuilder: (_) => Card(
      elevation: 3,
      child: widget,
    ),
  );
}

// simple toast
showSimpleText({required String msg}) {
  BotToast.showText(text: "$msg"); //popup a text toast;
}

// show toast with custom duration
showSimpleNotification({required String msg, String? title, Color? color}) {
  BotToast.showSimpleNotification(
    titleStyle:
        const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
    subTitleStyle:
        const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
    backgroundColor: color ?? Colors.teal.shade500.withOpacity(0.9),
    title: title ?? 'Oppss',
    subTitle: msg,
    duration: const Duration(seconds: 3),
  ); //popup a text notification;
}

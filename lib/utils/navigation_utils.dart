import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

Future<dynamic> pushNamedToReplace(
    {required String routeName, String? arg}) async {
  return await Navigator.of(Get.context!).pushReplacementNamed(
    routeName,
    arguments: arg,
  );
}

Future<dynamic> pushNamedToAndRemoveUntil({required String routeName}) async {
  return await Navigator.of(Get.context!)
      .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
}

Future<dynamic> pushNamedOnlyTo(
    {required String routeName, String? arg}) async {
  return await Navigator.of(Get.context!).pushNamed(routeName, arguments: arg);
}

Future<dynamic> pushToReplace(
    {BuildContext? context, required Widget widget, var data}) async {
  return await Navigator.of(context ?? Get.context!).pushReplacement(
    MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(arguments: data),
    ),
  );
}

Future<dynamic> pushToAndRemoveUntil(
    {BuildContext? context, required Widget widget, var data}) async {
  return await Navigator.of(context ?? Get.context!).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(arguments: data),
      ),
      (Route<dynamic> route) => false);
}

Future<dynamic> pushOnlyTo(
    {BuildContext? context, required Widget widget, var data}) async {
  return await Navigator.of(context ?? Get.context!).push(
    MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(arguments: data),
    ),
  );
}

dynamic fetchArgData({
  BuildContext? context,
}) {
  return ModalRoute.of(context ?? Get.context!)!.settings.arguments;
}

Future<dynamic> pop({
  var result,
}) async {
  return Navigator.of(Get.context!).pop(result);
}

Future<bool> disableDefaultBackNavigation({bool canCancel = false}) async {
  // await showDialog or Show add banners or whatever
  // then
  //return true; // return true if the route to be popped
  return canCancel; // return true if the route not to be popped
}

Future<dynamic> pushTransitionedReplaceTo({required Widget widget}) async {
  return await Navigator.pushReplacement(
      Get.context!,
      PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return widget;
          },
          transitionsBuilder:
              (___, Animation<double> animation, ____, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: RotationTransition(
                turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
                child: child,
              ),
            );
          }));
}

Future<dynamic> pushTransitionedOnlyTo({required Widget widget}) async {
  return await Navigator.push(
      Get.context!,
      PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return widget;
          },
          transitionsBuilder:
              (___, Animation<double> animation, ____, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: RotationTransition(
                turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
                child: child,
              ),
            );
          }));
}

// fade transition
Future<dynamic> pushFadeTransitionedOnlyTo({required Widget widget}) async {
  return await Navigator.push(
      Get.context!,
      PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return widget;
          },
          transitionsBuilder:
              (___, Animation<double> animation, ____, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          }));
}

// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:app/screens/auth/signupScreen.dart';
import 'package:app/screens/onboarding/onboarding.dart';
import 'package:app/services/auth/AuthService.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/utils/navigation_utils.dart';
import 'package:app/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:app/utils/sf_utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:lottie/lottie.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  static const String routeName = '/';

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late ConnectivityResult result;
  late StreamSubscription subscription;
  bool isConnected = false;
  @override
  void initState() {
    startStrem();

    super.initState();
  }

//checkb4transit(context);
  startStrem() {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      await checkInternet();
    });
  }

  checkInternet() async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isConnected = true;
      if (mounted && isConnected) {
        checkb4transit(Get.context!);
      }
    } else {
      isConnected = false;
      Get.defaultDialog(
          backgroundColor: Colors.white,
          title: "No Internet connection",
          middleText: 'Turn on your Internet connection',
          titleStyle: TextStyle(
            color: Colors.grey.shade600,
          ),
          middleTextStyle: TextStyle(
            color: Colors.grey.shade400,
          ),
          barrierDismissible: false,
          actions: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 45),
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                pushBack();
                checkInternet();
              },
              icon: const Icon(Icons.wifi_off_outlined),
              label: const Text("Retry"),
            )
          ]);
    }

    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final size = Utils(context).getScreenSize;

    return isConnected == false
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lottie/noInternet.json',
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/logo.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 65,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballSpinFadeLoader,
                      strokeWidth: 4,
                      colors: [AppColors.AppPrimary],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

// checkb4transit
Future checkb4transit(BuildContext context) async {
  log("checkb4transit");
  bool isOnBoardingComplete = await isOnBoardingDone();
  String token = await fetchStringValuesSF("authToken");

  await Future.delayed(const Duration(seconds: 2));
  // token check
  if (token != null && token.length > 5) {
    setOnBoardingAsCompleted();
    // ignore: use_build_context_synchronously
    AuthServices().tokenVerify(
        context); // pushNamedToReplace(routeName: BottomBarScreen.routeName);
  } else {
    AuthServices().signOut(context);
    pushNamedToAndRemoveUntil(
      // check onboarding complete
      routeName:
          isOnBoardingComplete ? SignUpScreen.routeName : OnBoarding.routeName,
    );

    setOnBoardingAsCompleted();
  }
}

//
Future<bool> isOnBoardingDone() async {
  return await fetchBoolValuesSF("isOnBoardingComplete");
}

// complete onboarding
Future setOnBoardingAsCompleted() async {
  await storeBoolToSF("isOnBoardingComplete", true);
}

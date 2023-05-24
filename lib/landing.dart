// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/screens/auth/signupScreen.dart';
import 'package:app/screens/bottom_bar_Screen.dart';
import 'package:app/screens/onboarding/onboarding.dart';
import 'package:app/services/auth/AuthService.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/navigation_utils.dart';
import 'package:app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:app/utils/sf_utils.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  static const String routeName = '/';

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    checkb4transit(context);
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snap) {
          return Center(
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
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                    border: Border(
                      right: BorderSide(color: AppColors.AppPrimary, width: 2),
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
          );
        },
      ),
    );
  }
}

// checkb4transit
Future checkb4transit(BuildContext context) async {
  // check network connectivity
  final bool isDataEnabled = await isNetOn();
  if (isDataEnabled) {
    bool isOnBoardingComplete = await isOnBoardingDone();
    String token = await fetchStringValuesSF("authToken");

    await Future.delayed(const Duration(seconds: 2));
    // token check
    if (token != null && token.length > 5) {
      setOnBoardingAsCompleted();
      // ignore: use_build_context_synchronously
      AuthServices().tokenVerify(context);
      pushNamedToReplace(routeName: BottomBarScreen.routeName);
    } else {
      AuthServices().signOut(context);
      pushNamedToAndRemoveUntil(
        // check onboarding complete
        routeName: isOnBoardingComplete
            ? SignUpScreen.routeName
            : OnBoarding.routeName,
      );
      setOnBoardingAsCompleted();
    }
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

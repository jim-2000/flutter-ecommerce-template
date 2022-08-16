import 'dart:developer';

import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/screens/auth/forgotPassword.dart';
import 'package:app/screens/auth/loginScreen.dart';
import 'package:app/screens/auth/resetPassword.dart';
import 'package:app/screens/auth/signupScreen.dart';
import 'package:app/screens/homeScreen.dart';
import 'package:app/services/dark_them_pref.dart';
import 'package:app/utils/themeData.dart';
import 'package:app/screens/bottom_bar_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final darkThemePrefs = DarkThemePrefs();

  DarkTheemProvider darkTheemProvider = DarkTheemProvider();

  void getCurrentAppTheme() async {
    darkTheemProvider.setDarkTheme = await darkThemePrefs.getTheme;
    log(darkTheemProvider.getDark.toString());
  }

//
  @override
  void initState() {
    getCurrentAppTheme();
    // TODO: implement initState
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    bool isdark = false;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => darkTheemProvider,
        )
      ],
      child: Consumer<DarkTheemProvider>(
        builder: (contex, darkTheemProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Grocery App',
            theme: Style.themeData(darkTheemProvider.getDark, context),
            home: const BottomBarScreen(),
            // home: const SignUpScreen(),
            // home: const ForgotPassword(),
            // home: const ResetPassword(),
          );
        },
      ),
    );
  }
}

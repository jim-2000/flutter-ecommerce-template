import 'dart:developer';

import 'package:app/provider/cartProvider.dart';
import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/provider/productProvider.dart';
import 'package:app/provider/wishListProvider.dart';
import 'package:app/screens/auth/forgotPassword.dart';
import 'package:app/screens/auth/loginScreen.dart';
import 'package:app/screens/auth/resetPassword.dart';
import 'package:app/screens/auth/signupScreen.dart';
import 'package:app/screens/cart/cart_screen.dart';
import 'package:app/screens/catagories/catagoriesProduct.dart';
import 'package:app/screens/homeScreens/detailsScreen.dart';
import 'package:app/screens/homeScreens/homeScreen.dart';
import 'package:app/services/dark_them_pref.dart';
import 'package:app/utils/themeData.dart';
import 'package:app/screens/bottom_bar_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // theme provider
        ChangeNotifierProvider(
          create: (_) => darkTheemProvider,
        ),
        // product provider
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
        // wishlist provider
        ChangeNotifierProvider(
          create: (_) => WishListProvider(),
        ),
        // cart provider
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: Consumer<DarkTheemProvider>(
        builder: (contex, darkTheemProvider, _) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Grocery App',
            theme: Style.themeData(darkTheemProvider.getDark, context),
            // home: Directionality(
            //   textDirection: TextDirection.ltr,
            //   child: Categories(),
            // ),
            initialRoute: BottomBarScreen.routeName,
            routes: {
              // auth routes
              LoginScreen.routeName: (context) => const LoginScreen(),
              SignUpScreen.routeName: (context) => const SignUpScreen(),
              ResetPassword.routeName: (context) => const ResetPassword(),
              ForgotPassword.routeName: (context) => const ForgotPassword(),
              // app routes
              BottomBarScreen.routeName: (context) => const BottomBarScreen(),
              DetailsScreen.routeName: (context) => DetailsScreen(),
              CartScreen.routeName: (context) => const CartScreen(),
              CatagoryProduct.routeName: (context) => CatagoryProduct(),
            },
          );
        },
      ),
    );
  }
}

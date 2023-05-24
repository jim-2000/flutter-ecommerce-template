import 'dart:developer';

import 'package:app/landing.dart';
import 'package:app/provider/OrderProvider.dart';
import 'package:app/provider/auth/UserProvider.dart';
import 'package:app/provider/cartProvider.dart';
import 'package:app/provider/catagoriProvider.dart';
import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/provider/productProvider.dart';
import 'package:app/provider/wishListProvider.dart';
import 'package:app/screens/auth/forgotPassword.dart';
import 'package:app/screens/auth/loginScreen.dart';
import 'package:app/screens/auth/otpScreen.dart';
import 'package:app/screens/auth/resetPassword.dart';
import 'package:app/screens/auth/signupScreen.dart';
import 'package:app/screens/cart/cart_screen.dart';
import 'package:app/screens/catagories/catagories.dart';
import 'package:app/screens/catagories/catagoriesProduct.dart';
import 'package:app/screens/homeScreens/detailsScreen.dart';
import 'package:app/screens/onboarding/onboarding.dart';
import 'package:app/screens/order/OrderScreen.dart';
import 'package:app/screens/payment/payment.dart';
import 'package:app/screens/wishlist/wishlist.dart';
import 'package:app/utils/sf_utils.dart';
import 'package:app/utils/themeData.dart';
import 'package:app/screens/bottom_bar_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:app/utils/network_utils.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeProvider darkTheemProvider = ThemeProvider();
  getCurrentTheme() async {
    darkTheemProvider.setDarkMode = await fetchBoolValuesSF("isDark");
  }

  //
  @override
  void initState() {
    getCurrentTheme();
    // TODO: implement initState
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // theme provider
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CatagoriProvider(),
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
        // cart provider
        ChangeNotifierProvider(
          create: (_) => OrderProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (contex, darkTheemProvider, _) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Grocery App',
            theme: Style.themeData(darkTheemProvider.isDark, context),
            builder: BotToastInit(),
            initialRoute: LandingPage.routeName,
            routes: {
              OnBoarding.routeName: (contex) => const OnBoarding(),
              LandingPage.routeName: (contex) => const LandingPage(),
              // auth routes
              LoginScreen.routeName: (context) => const LoginScreen(),
              SignUpScreen.routeName: (context) => const SignUpScreen(),
              OtpScreen.routeName: (context) => const OtpScreen(),
              ResetPassword.routeName: (context) => const ResetPassword(),
              ForgotPassword.routeName: (context) => const ForgotPassword(),
              // app routes
              BottomBarScreen.routeName: (context) => const BottomBarScreen(),
              DetailsScreen.routeName: (context) => DetailsScreen(),
              CartScreen.routeName: (context) => const CartScreen(),
              Categories.routeName: (context) => Categories(),
              WishlistScreen.routeName: (context) => const WishlistScreen(),
              OrderScreen.routeName: (context) => const OrderScreen(),
              // payment route
              PaymentScreen.routeName: (context) => const PaymentScreen(),
            },
          );
        },
      ),
    );
  }
}

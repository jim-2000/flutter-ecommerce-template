import 'dart:developer';

import 'package:app/app.dart';
import 'package:app/landing.dart';
import 'package:app/provider/OrderProvider.dart';
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
import 'package:app/screens/order/OrderScreen.dart';
import 'package:app/screens/payment/payment.dart';
import 'package:app/screens/wishlist/wishlist.dart';
import 'package:app/utils/sf_utils.dart';
import 'package:app/utils/themeData.dart';
import 'package:app/screens/bottom_bar_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   DarkTheemProvider darkTheemProvider = DarkTheemProvider();
//   getCurrentTheme() async {
//     darkTheemProvider.setDarkTheme = await fetchBoolValuesSF("isDark");
//   }

//   //
//   @override
//   void initState() {
//     getCurrentTheme();
//     // TODO: implement initState
//     super.initState();
//   }

//   //
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         // theme provider
//         ChangeNotifierProvider(
//           create: (_) => DarkTheemProvider(),
//         ),
//         // product provider
//         ChangeNotifierProvider(
//           create: (_) => ProductProvider(),
//         ),
//         // wishlist provider
//         ChangeNotifierProvider(
//           create: (_) => WishListProvider(),
//         ),
//         // cart provider
//         ChangeNotifierProvider(
//           create: (_) => CartProvider(),
//         ),
//         // cart provider
//         ChangeNotifierProvider(
//           create: (_) => OrderProvider(),
//         ),
//       ],
//       child: Consumer<DarkTheemProvider>(
//         builder: (contex, darkTheemProvider, _) {
//           return GetMaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Grocery App',
//             theme: Style.themeData(darkTheemProvider.getDark, context),
//             // home: Directionality(
//             //   textDirection: TextDirection.ltr,
//             //   child: Categories(),
//             // ),
//             initialRoute: LandingPage.routeName,
//             routes: {
//               LandingPage.routeName: (contex) => const LandingPage(),
//               // auth routes
//               LoginScreen.routeName: (context) => const LoginScreen(),
//               SignUpScreen.routeName: (context) => const SignUpScreen(),
//               ResetPassword.routeName: (context) => const ResetPassword(),
//               ForgotPassword.routeName: (context) => const ForgotPassword(),
//               // app routes
//               BottomBarScreen.routeName: (context) => const BottomBarScreen(),
//               DetailsScreen.routeName: (context) => DetailsScreen(),
//               CartScreen.routeName: (context) => const CartScreen(),
//               CatagoryProduct.routeName: (context) => const CatagoryProduct(),
//               WishlistScreen.routeName: (context) => const WishlistScreen(),
//               OrderScreen.routeName: (context) => const OrderScreen(),
//               // payment route
//               PaymentScreen.routeName: (context) => const PaymentScreen(),
//             },
//           );
//         },
//       ),
//     );
//   }
// }

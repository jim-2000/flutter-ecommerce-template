import 'package:app/provider/cartProvider.dart';
import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/provider/wishListProvider.dart';
import 'package:app/screens/cart/cart_screen.dart';
import 'package:app/screens/catagories/CatagoriProducts.dart';
import 'package:app/screens/catagories/catagory_Screen.dart';
import 'package:app/screens/feed/feedScreen.dart';
import 'package:app/screens/homeScreens/homeScreen.dart';
import 'package:app/screens/user/userScreen.dart';
import 'package:app/services/app/productService.dart';
import 'package:app/utils/appColors.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/services/app/catagoriService.dart';
import 'package:badges/badges.dart' as badges;

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);
  static const String routeName = 'app/bottomScreen';

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedINdex = 0;
  final catagoriService = CatagoriServices();
  final productService = ProductService();

//

  void _selecxtedIndex(int index) {
    setState(() {
      _selectedINdex = index;
    });
  }

  @override
  void initState() {
    syncData();
    super.initState();
  }

  Future<void> syncData() async {
    Provider.of<CartProvider>(context, listen: false).syncCart();
    Provider.of<WishListProvider>(context, listen: false).syncwish();

    Future.delayed(Duration.zero, () async {
      catagoriService.getAllCategories(context);
      productService.getAllProducts(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);

    final List pages = [
      const HomeScreen(),
      const FeedScreen(),
      const CartScreen(),
      const UserScreen(),
    ];
    final themeState = Provider.of<ThemeProvider>(context);
    //
    return Scaffold(
      body: pages[_selectedINdex],
      bottomNavigationBar: BottomNavyBar(
        containerHeight: 50,
        itemCornerRadius: 50,
        curve: Curves.fastOutSlowIn,
        selectedIndex: _selectedINdex,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        showElevation: true,
        // backgroundColor: AppColors.AppBlack,
        items: [
          BottomNavyBarItem(
            icon: Icon(
              _selectedINdex == 0
                  ? Icons.home_max_rounded
                  : Icons.home_max_outlined,
            ),
            title: const Text('Home'),
            activeColor: AppColors.AppPrimary,
            inactiveColor: themeState.isDark
                ? Colors.lightBlue.shade200
                : AppColors.AppBlack,
          ),

          //
          BottomNavyBarItem(
            icon: Icon(
              _selectedINdex == 1
                  ? Icons.drag_indicator
                  : Icons.drag_indicator_outlined,
            ),
            title: const Text('Feed'),
            activeColor: AppColors.AppPrimary,
            inactiveColor: themeState.isDark
                ? Colors.lightBlue.shade200
                : AppColors.AppBlack,
          ),
          BottomNavyBarItem(
            icon: Consumer<CartProvider>(builder: (context, cp, _) {
              return Expanded(
                child: badges.Badge(
                  badgeAnimation: const badges.BadgeAnimation.slide(),
                  badgeContent: Text(
                    cartProvider.cartList.length.toString(),
                    style: const TextStyle(fontSize: 8),
                  ),
                  position: badges.BadgePosition.topEnd(top: -5, end: -7),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                ),
              );
            }),
            title: const Text('cart'),
            activeColor: AppColors.AppPrimary,
            inactiveColor: themeState.isDark
                ? Colors.lightBlue.shade200
                : AppColors.AppBlack,
          ),
          BottomNavyBarItem(
            icon: Icon(
                _selectedINdex == 3 ? Icons.settings : Icons.settings_outlined),
            title: const Text('Settings'),
            activeColor: AppColors.AppPrimary,
            inactiveColor: themeState.isDark
                ? Colors.lightBlue.shade200
                : AppColors.AppBlack,
          ),
        ],
        onItemSelected: (index) {
          _selecxtedIndex(index);
        },
      ),
    );
  }
}

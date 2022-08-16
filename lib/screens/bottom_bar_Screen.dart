import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/screens/cart_screen.dart';
import 'package:app/screens/catagory_Screen.dart';
import 'package:app/screens/homeScreen.dart';
import 'package:app/screens/userScreen.dart';
import 'package:app/utils/appColors.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedINdex = 0;

//

  //

  @override
  void _selecxtedIndex(int index) {
    setState(() {
      _selectedINdex = index;
    });
  }

  //

  Widget build(BuildContext context) {
//

    final List _pages = [
      const HomeScreen(),
      const CatagoryScreen(),
      const CartScreen(),
      const UserScreen(),
      // const ShowBottomMOdal()
    ];
//

    final themeState = Provider.of<DarkTheemProvider>(context);
    //
    return Scaffold(
      //
      body: _pages[_selectedINdex],
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
            inactiveColor: themeState.getDark
                ? Colors.lightBlue.shade200
                : AppColors.AppBlack,
          ),
          BottomNavyBarItem(
            icon: Icon(
              _selectedINdex == 1 ? Icons.apps_outage_outlined : Icons.apps,
            ),
            title: const Text('Catagory'),
            activeColor: AppColors.AppPrimary,
            inactiveColor: themeState.getDark
                ? Colors.lightBlue.shade200
                : AppColors.AppBlack,
          ),
          BottomNavyBarItem(
            icon: Icon(
              _selectedINdex == 2
                  ? Icons.shopping_cart
                  : Icons.shopping_cart_outlined,
            ),
            title: const Text('cart'),
            activeColor: AppColors.AppPrimary,
            inactiveColor: themeState.getDark
                ? Colors.lightBlue.shade200
                : AppColors.AppBlack,
          ),
          BottomNavyBarItem(
            icon: Icon(
                _selectedINdex == 3 ? Icons.people : Icons.people_alt_outlined),
            title: const Text('User'),
            activeColor: AppColors.AppPrimary,
            inactiveColor: themeState.getDark
                ? Colors.lightBlue.shade200
                : AppColors.AppBlack,
          ),
          //
        ],
        onItemSelected: (index) => _selecxtedIndex(index),
      ),
    );
  }
}

class ShowBottomMOdal extends StatelessWidget {
  const ShowBottomMOdal({Key? key}) : super(key: key);

  @override
  build(BuildContext context) async {
    return await showMaterialModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Container(
          height: 500,
          child: Text("Viewd Adress"),
        ),
      ),
    );
  }
}

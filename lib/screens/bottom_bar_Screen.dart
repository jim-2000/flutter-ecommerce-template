import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/screens/cart/cart_screen.dart';
import 'package:app/screens/catagories/catagories.dart';
import 'package:app/screens/homeScreens/homeScreen.dart';
import 'package:app/screens/user/userScreen.dart';
import 'package:app/utils/appColors.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);
  static const String routeName = 'app/bottomScreen';

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedINdex = 0;

//

  @override
  void _selecxtedIndex(int index) {
    setState(() {
      _selectedINdex = index;
    });
  }

  //

  @override
  Widget build(BuildContext context) {
//

    final List pages = [
      const HomeScreen(),
      // const CatagoryScreen(),
      Categories(),
      const CartScreen(),
      Container(
        child: const Center(
          child: Text('Chating'),
        ),
      ),
      const UserScreen(),
    ];
//

    final themeState = Provider.of<ThemeProvider>(context);
    //
    return Scaffold(
      //
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
          BottomNavyBarItem(
            icon: Icon(
              _selectedINdex == 1 ? Icons.apps_outage_outlined : Icons.apps,
            ),
            title: const Text('Catagory'),
            activeColor: AppColors.AppPrimary,
            inactiveColor: themeState.isDark
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
            inactiveColor: themeState.isDark
                ? Colors.lightBlue.shade200
                : AppColors.AppBlack,
          ),
          //
          BottomNavyBarItem(
            icon: Icon(_selectedINdex == 3
                ? Icons.message_sharp
                : Icons.message_sharp),
            title: const Text('Chat'),
            activeColor: AppColors.AppPrimary,
            inactiveColor: themeState.isDark
                ? Colors.lightBlue.shade200
                : AppColors.AppBlack,
          ),
          BottomNavyBarItem(
            icon: Icon(
                _selectedINdex == 4 ? Icons.settings : Icons.settings_outlined),
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

// class ShowBottomMOdal extends StatelessWidget {
//   const ShowBottomMOdal({Key? key}) : super(key: key);

//   @override
//   build(BuildContext context) async {
//     return await showMaterialModalBottomSheet(
//       context: context,
//       builder: (context) => SingleChildScrollView(
//         controller: ModalScrollController.of(context),
//         child: const SizedBox(
//           height: 500,
//           child: Text("Viewd Adress"),
//         ),
//       ),
//     );
//   }
// }

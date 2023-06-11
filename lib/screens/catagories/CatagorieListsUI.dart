import 'dart:math';

import 'package:app/provider/cartProvider.dart';
import 'package:app/provider/catagoriProvider.dart';
import 'package:app/provider/productProvider.dart';
import 'package:app/provider/wishListProvider.dart';
import 'package:app/screens/cart/cart_screen.dart';
import 'package:app/screens/wishlist/wishlist.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/widgets/cart/emptyCart.dart';
import 'package:app/widgets/catagory/catagoryCard.dart';
import 'package:app/widgets/catagory/catagorytwo.dart';
import 'package:app/widgets/home/feedWidget.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatagorieListsUI extends StatelessWidget {
  static String routeName = '/allcatagories';
  const CatagorieListsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // product provider
    final CatagoriProvider catProvider = Provider.of<CatagoriProvider>(context);
    // wishlist provider
    final WishListProvider wishlist = Provider.of<WishListProvider>(context);
    // cart provider
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Catagories'),
        elevation: 0,
        actions: [
          Consumer<WishListProvider>(builder: (context, wp, _) {
            return badges.Badge(
              badgeAnimation: const badges.BadgeAnimation.slide(),
              badgeContent: Text(wishlist.wishList.length.toString()),
              position: badges.BadgePosition.topEnd(top: 5, end: 7),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(WishlistScreen.routeName);
                },
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.deepPurple,
                ),
              ),
            );
          }),
          Consumer<CartProvider>(builder: (context, cp, _) {
            return badges.Badge(
              badgeAnimation: const badges.BadgeAnimation.slide(),
              badgeContent: Text(cartProvider.cartList.length.toString()),
              position: badges.BadgePosition.topEnd(top: 5, end: 7),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.deepPurple,
                ),
              ),
            );
          }),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, i) {
            final cat = catProvider.catagori()[i];
            return SizedBox(
                height: size.height / 6,
                width: double.infinity,
                child: CatagorytwoWidget(cata: cat));
          },
          itemCount: catProvider.catagori().length,
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:app/api/call.dart';
import 'package:app/api/url.dart';
import 'package:app/models/app/productModel.dart';
import 'package:app/models/products.dart';
import 'package:app/provider/cartProvider.dart';
import 'package:app/provider/catagoriProvider.dart';
import 'package:app/provider/productProvider.dart';
import 'package:app/provider/wishListProvider.dart';
import 'package:app/screens/cart/cart_screen.dart';
import 'package:app/screens/wishlist/wishlist.dart';
import 'package:app/services/app/catagoriService.dart';
import 'package:app/services/app/productService.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/widgets/catagory/catagorytwo.dart';
import 'package:app/widgets/home/feedWidget.dart';
import 'package:app/widgets/home/latestProduct.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CatagoriProducts extends StatefulWidget {
  static String routeName = '/CatagoriProducts';

  const CatagoriProducts({Key? key}) : super(key: key);

  @override
  State<CatagoriProducts> createState() => _CatagoriProductsState();
}

class _CatagoriProductsState extends State<CatagoriProducts> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments.toString().split(
          '&&',
        );
    final catId = arg[0].trim();
    final name = arg[1].trim();
    log('Name:${name.toString()} id:${catId.toString()}');
    final size = Utils(context).getScreenSize;

    // wishlist provider
    final WishListProvider wishlist = Provider.of<WishListProvider>(context);
    // cart provider
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final ProductProvider prodProvider = Provider.of<ProductProvider>(context);
    //
    Future<List<Product>> _fetchProductsByCategory(String categoryId) async {
      http.Response res =
          await reqGetAPIMethod(Url.getProductCatagori + categoryId);

      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        final List<Product> products =
            data.map((json) => Product.fromJson(json)).toList();
        return products;
      } else {
        throw Exception('Failed to fetch products');
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(name),
        actions: [
          Consumer<WishListProvider>(builder: (context, wp, _) {
            return badges.Badge(
              badgeAnimation: const badges.BadgeAnimation.slide(),
              badgeContent: Text(
                wishlist.wishList.length.toString(),
                style: const TextStyle(color: Colors.black),
              ),
              position: badges.BadgePosition.topEnd(top: 5, end: 7),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(WishlistScreen.routeName);
                },
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: AppColors.AppPrimary,
                ),
              ),
            );
          }),
          Consumer<CartProvider>(builder: (context, cp, _) {
            return badges.Badge(
              badgeAnimation: const badges.BadgeAnimation.slide(),
              badgeContent: Text(
                cartProvider.cartList.length.toString(),
                style: const TextStyle(color: Colors.black),
              ),
              position: badges.BadgePosition.topEnd(top: 5, end: 7),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.AppPrimary,
                ),
              ),
            );
          }),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        initialData: prodProvider.catagoriproduct(),
        future: _fetchProductsByCategory(catId),
        builder: (
          context,
          snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Handle API error
            return Text('Failed to fetch products');
          } else if (snapshot.hasData) {
            final List<Product> products = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (context, i) {
                  return SizedBox(
                    height: size.height / 3,
                    // Animate hare --------------------------------
                    child: FeeedWidget(
                      products: products[i],
                      cw: double.infinity,
                      ch: size.height / 6,
                    ),
                  );
                },
                itemCount: products.length,
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

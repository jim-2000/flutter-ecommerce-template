import 'dart:developer';

import 'package:app/models/app/productModel.dart';
import 'package:app/provider/cartProvider.dart';
import 'package:app/provider/wishListProvider.dart';
import 'package:app/screens/homeScreens/detailsScreen.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/utils/navigation_utils.dart';
import 'package:badges/badges.dart' as badges;
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LatestProduct extends StatelessWidget {
  LatestProduct({Key? key, required this.products}) : super(key: key);
  Product products;
  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final theme = Utils(context).getTheme;

    // >>>>>>>>>> provider
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final WishListProvider wishListProvider =
        Provider.of<WishListProvider>(context);

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: theme ? AppColors.AppBg : AppColors.AppGrey,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          pushNamedOnlyTo(routeName: DetailsScreen.routeName, arg: products.id);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FancyShimmerImage(
                    imageUrl: products.thumbnail.url,
                    width: size.width / 2,
                    height: size.height * 0.15,
                    boxFit: BoxFit.cover,
                  ),
                  Text(
                    '${products.name.substring(0, products.name.length > 18 ? 18 : products.name.length)}...',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    products.catagoryName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "\$ ${products.price}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    // this row for  future dev if you need to add more data
                    children: const [
                      Text(
                        "4.5",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.deepOrange,
                        size: 10,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.deepOrange,
                        size: 10,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.deepOrange,
                        size: 10,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.deepOrange,
                        size: 10,
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                  child: IconButton(
                      onPressed: () {
                        wishListProvider.addToWishList(products);
                      },
                      icon: Icon(
                        wishListProvider.isItemInWish(products.id)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.redAccent,
                      )),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                  child: IconButton(
                    onPressed: () {
                      cartProvider.addToCart(products.id, products);
                    },
                    icon: Icon(
                      cartProvider.isItemInCart(products.id)
                          ? Icons.shopping_cart
                          : Icons.add_shopping_cart,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
              badges.Badge(
                badgeAnimation: const badges.BadgeAnimation.fade(),
                badgeStyle: badges.BadgeStyle(
                  shape: badges.BadgeShape.square,
                  borderRadius: BorderRadius.circular(4),
                  elevation: 5,
                  badgeColor: products.oldPrice > products.price
                      ? Colors.pink
                      : Colors.deepPurple,
                ),
                showBadge: true,
                badgeContent: Text(
                  products.oldPrice > products.price ? 'offer' : 'New',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

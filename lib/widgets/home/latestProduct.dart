import 'dart:developer';

import 'package:app/models/productModel.dart';
import 'package:app/screens/homeScreens/detailsScreen.dart';
import 'package:app/utils/apputils.dart';
import 'package:badges/badges.dart' as badges;
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// ignore: must_be_immutable
class LatestProduct extends StatelessWidget {
  LatestProduct({Key? key, required this.products}) : super(key: key);
  Product products;
  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
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
          Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: products.id,
          );
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
                    imageUrl: products.imageUrl[0],
                    width: size.width / 2,
                    height: size.height * 0.15,
                    boxFit: BoxFit.cover,
                  ),
                  Text(
                    products.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    products.catagories,
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
                right: 10,
                top: 10,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white70,
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
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
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.deepOrange,
                      )),
                ),
              ),
              badges.Badge(
                badgeAnimation: const badges.BadgeAnimation.fade(),
                badgeStyle: badges.BadgeStyle(
                  shape: badges.BadgeShape.square,
                  borderRadius: BorderRadius.circular(4),
                  elevation: 5,
                  badgeColor: products.catagories == 'Phones'
                      ? Colors.red
                      : Colors.deepOrange,
                ),
                showBadge: true,
                badgeContent: Text(
                  products.catagories == 'Phones' ? 'New' : 'offer',
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

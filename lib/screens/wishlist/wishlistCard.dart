import 'dart:developer';

import 'package:app/models/wishlistModel.dart';
import 'package:app/provider/wishListProvider.dart';
import 'package:app/screens/homeScreens/detailsScreen.dart';
import 'package:app/utils/navigation_utils.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistCard extends StatelessWidget {
  WishListModel wishlistAttribute;
  WishlistCard({Key? key, required this.wishlistAttribute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // provider

    return InkWell(
      onTap: () {
        pushNamedOnlyTo(
            routeName: DetailsScreen.routeName, arg: wishlistAttribute.wishId);
      },
      child: Card(
        elevation: 3,
        color: Theme.of(context).cardTheme.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(5.0),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            height: 105,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FancyShimmerImage(
                        imageUrl: wishlistAttribute.imageUrl,
                        width: 100,
                        height: 100,
                        boxFit: BoxFit.cover,
                        errorWidget: Text(wishlistAttribute.title),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                wishlistAttribute.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            Text(
                              wishlistAttribute.wishId,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const Text(
                              'size: M',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const Text(
                              'Quantiti: 1',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Center(
                    child: Text(
                      '\$${wishlistAttribute.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

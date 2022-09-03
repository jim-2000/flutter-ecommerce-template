import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:app/provider/wishListProvider.dart';
import 'package:app/screens/wishlist/wishlistCard.dart';
import 'package:app/utils/appButton.dart';
import 'package:app/utils/apputils.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist';
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// app utils
    final sizes = Utils(context).getScreenSize;
    final btn = AppButton();
    // providers
    final wishlistprovider = Provider.of<WishListProvider>(context);

    return wishlistprovider.wishList.isEmpty
        ? Scaffold(
            body: Center(
              child: EmptyWidget(
                image: null,
                packageImage: PackageImage.Image_1,
                title: 'Empty Wishlist',
                subTitle: 'No  wishlist available yet',
                titleTextStyle: const TextStyle(
                  fontSize: 22,
                  color: Color(0xff9da9c7),
                  fontWeight: FontWeight.w500,
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xffabb8d6),
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('My Wishlist ${wishlistprovider.wishList.length}'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: sizes.height * 0.8,
                      width: sizes.width,
                      child: ListView.builder(
                        itemCount: wishlistprovider.wishList.length,
                        itemBuilder: (context, index) {
                          final wp =
                              wishlistprovider.wishList.values.toList()[index];
                          final key =
                              wishlistprovider.wishList.keys.toList()[index];

                          return ChangeNotifierProvider.value(
                            value: wp,
                            child: ElasticInDown(
                              duration: Duration(seconds: 2),
                              delay: Duration(milliseconds: index * 100),
                              child: Dismissible(
                                key: Key(key),
                                onDismissed: (direction) {
                                  wishlistprovider.removeFromWishList(key);
                                },
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  color: Colors.red,
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                child: const WishlistCard(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    //
                    btn.appTextButton(Colors.black, onPressed: () {
                      wishlistprovider.removeAll();
                    }, text: "Clear Wishlist"),
                  ],
                ),
              ),
            ),
          );
  }
}

import 'dart:developer';

import 'package:app/models/productModel.dart';
import 'package:app/models/wishlistModel.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider extends ChangeNotifier {
  //
  Map<String, WishListModel> _wishList = {};
  Map<String, WishListModel> get wishList => _wishList;
  //add to wishlist
  void addToWishList(String wId, Product product) {
    if (_wishList.containsKey(wId)) {
      _wishList.remove(wId);
      log("remove to wishlist");
    } else {
      _wishList.putIfAbsent(
        wId,
        () => WishListModel(
          wishId: DateTime.now().toIso8601String(),
          title: product.title,
          imageUrl: product.imageUrl[0],
          price: product.price,
        ),
      );
      log("add to wishlist");
    }
    notifyListeners();
  }

  // remove from wishlist
  void removeFromWishList(String wId) {
    if (_wishList.containsKey(wId)) {
      log(wId);
      _wishList.remove(wId);
    }
    log(wishList.length.toString());
    notifyListeners();
  }

  // remove all
  void removeAll() {
    _wishList.clear();
    notifyListeners();
  }

  // is item in wishlist
  bool isInWishList(String wId) {
    return _wishList.containsKey(wId);
  }
}

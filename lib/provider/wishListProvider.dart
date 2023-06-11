import 'dart:convert';
import 'dart:developer';

import 'package:app/models/app/productModel.dart';
import 'package:app/models/wishlistModel.dart';
import 'package:app/utils/sf_utils.dart';
import 'package:app/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WishListProvider extends ChangeNotifier {
  //
  List<WishListModel> _wishList = [];
  List<WishListModel> get wishList => _wishList;

  @mustCallSuper
  Future syncwish() async {
    List<String>? jsonList = await fetchListValuesSF('wishList');
    List<WishListModel> prefList = [];
    if (jsonList != null) {
      for (String json in jsonList) {
        dynamic datamap = jsonDecode(json);
        WishListModel tempCart = WishListModel.fromJson(datamap);
        prefList.add(tempCart);
      }
      _wishList = prefList;
    }
    notifyListeners();
  }

  //add to wishlist
  void addToWishList(Product wish) {
    if (isItemInWish(wish.id)) {
      showSimpleNotification(msg: 'Alrady in wishList');
    } else {
      _wishList.add(
        WishListModel(
          wishId: wish.id,
          title: wish.name,
          imageUrl: wish.thumbnail.url,
          price: wish.price.toDouble(),
        ),
      );
      clearValueFromSF('wishList');

      List<String>? jsonList = [];
      for (WishListModel wish in wishList) {
        final json = jsonEncode(wish);
        jsonList.add(json);
      }
      storeListToSF("wishList", jsonList);
    }
    notifyListeners();
  }

  // remove from wishlist
  void removeFromWishList(String wId) {
    if (isItemInWish(wId)) {
      _wishList.removeWhere((element) => element.wishId == wId);
      clearValueFromSF('wishList');
      List<String>? jsonList = [];
      for (WishListModel wish in wishList) {
        final json = jsonEncode(wish);
        jsonList.add(json);
      }
      storeListToSF("wishList", jsonList);
    }
    notifyListeners();
  }

  // remove all
  void removeAll() {
    _wishList.clear();
    clearValueFromSF('wishList');
    notifyListeners();
  }

  // is item in cart
  bool isItemInWish(String wId) {
    final alrady = _wishList.indexWhere((element) => element.wishId == wId);

    if (alrady != -1) {
      return true;
    }

    return false;
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:app/models/cartModel.dart';
import 'package:app/models/app/productModel.dart';
import 'package:app/utils/sf_utils.dart';
import 'package:app/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> _cartList = [];
  List<Cart> get cartList => _cartList;

  @mustCallSuper
  Future syncCart() async {
    List<String>? jsonList = await fetchListValuesSF('cartList');
    List<Cart> prefList = [];
    if (jsonList != null) {
      for (String json in jsonList) {
        dynamic datamap = jsonDecode(json);
        Cart tempCart = Cart.fromJson(datamap);
        prefList.add(tempCart);
      }
      _cartList = prefList;
    }
    notifyListeners();
  }

  // total amount
  double get totalAmount {
    double total = 0.0;
    _cartList.forEach((element) => {total += element.price * element.quantity});
    return total.toDouble();
  }

  // add to cart
  void addToCart(String cId, Product product) {
    Cart? alrady = _cartList.firstWhereOrNull((element) => element.id == cId);
    if (alrady != null) {
      // final update = _cartList.remove(alrady);
      incrimentItem(cId);
      //  clearfull list
      clearValueFromSF('cartList');
      List<String>? jsonList = [];
      for (Cart cart in cartList) {
        final json = jsonEncode(cart);
        jsonList.add(json);
      }
      storeListToSF("cartList", jsonList);

      log(jsonList.toString());
      showSimpleNotification(title: 'Item updated successfully', msg: '');
    } else {
      _cartList.add(
        Cart(
          id: product.id,
          name: product.name,
          img: product.thumbnail.url,
          price: product.price.toDouble(),
          quantity: 1,
        ),
      );
      //  clearfull list
      clearValueFromSF('cartList');
      List<String>? jsonList = [];
      for (Cart cart in cartList) {
        final json = jsonEncode(cart);
        jsonList.add(json);
      }
      storeListToSF("cartList", jsonList);
      showSimpleNotification(
        title: 'Item added to cart',
        msg: '',
      );
    }
    notifyListeners();
  }

  // decriment from cart item quantity
  void decrimentItem(String cId) {
    final cartItemIndex = _cartList.indexWhere((element) => element.id == cId);
    if (cartItemIndex != -1) {
      final cItem = _cartList[cartItemIndex].quantity--;
      //  clearfull list
      clearValueFromSF('cartList');
      List<String>? jsonList = [];
      for (Cart cart in cartList) {
        final json = jsonEncode(cart);
        jsonList.add(json);
      }
      storeListToSF("cartList", jsonList);
    }
    log(totalAmount.toString());
    notifyListeners();
  }

  // incriment from cart item quantity
  void incrimentItem(String cId) {
    final cartItemIndex = _cartList.indexWhere((element) => element.id == cId);
    if (cartItemIndex != -1) {
      final cItem = _cartList[cartItemIndex].quantity++;
      //  clearfull list
      clearValueFromSF('cartList');
      List<String>? jsonList = [];
      for (Cart cart in cartList) {
        final json = jsonEncode(cart);
        jsonList.add(json);
      }
      storeListToSF("cartList", jsonList);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(String cId) {
    _cartList.removeWhere((element) => element.id == cId);
    //  clearfull list
    clearValueFromSF('cartList');
    List<String>? jsonList = [];
    for (Cart cart in cartList) {
      final json = jsonEncode(cart);
      jsonList.add(json);
    }
    storeListToSF("cartList", jsonList);
    log(_cartList.length.toString());
    notifyListeners();
  }

  //
  void clearCart() {
    _cartList.clear();
    clearValueFromSF('cartList');
    notifyListeners();
  }

  // is item in cart
  bool isItemInCart(String cId) {
    final alrady = _cartList.indexWhere((element) => element.id == cId);

    if (alrady != -1) {
      return true;
    }

    return false;
  }
}

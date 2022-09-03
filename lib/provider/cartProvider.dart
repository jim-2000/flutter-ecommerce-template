import 'dart:developer';

import 'package:app/models/cartModel.dart';
import 'package:app/models/productModel.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  Map<String, Cart> _cartList = {};
  Map<String, Cart> get cartList => _cartList;
  // total amount
  double get totalAmount {
    double total = 0.0;
    _cartList.forEach((key, cart) {
      total += cart.quantity * cart.price;
    });
    return total.floor().toDouble();
  }

  // add to cart
  void addToCart(String cId, Product product) {
    //
    if (_cartList.containsKey(cId)) {
      _cartList.update(
        cId,
        (value) => Cart(
          cartId: value.cartId,
          title: value.title,
          imageUrl: value.imageUrl,
          price: value.price,
          quantity: value.quantity + 1,
        ),
      );
      print("same product added multiple time");
    } else {
      _cartList.putIfAbsent(
        cId,
        () => Cart(
          cartId: DateTime.now().toIso8601String(),
          title: product.title,
          imageUrl: product.imageUrl[0],
          price: product.price,
          quantity: 1,
        ),
      );
      print(" product added  =======");
    }
    notifyListeners();
    //
  }

  // decriment from cart item quantity
  void decrimentItem(String cId) {
    if (_cartList.containsKey(cId)) {
      _cartList.update(
        cId,
        (value) => Cart(
          cartId: value.cartId,
          title: value.title,
          imageUrl: value.imageUrl,
          price: value.price,
          quantity: value.quantity - 1,
        ),
      );
    }

    notifyListeners();
  }

  // incriment from cart item quantity
  void incrimentItem(String cId) {
    if (_cartList.containsKey(cId)) {
      _cartList.update(
        cId,
        (value) => Cart(
          cartId: value.cartId,
          title: value.title,
          imageUrl: value.imageUrl,
          price: value.price,
          quantity: value.quantity + 1,
        ),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(String cId) {
    _cartList.remove(cId);
    log(_cartList.length.toString());
    notifyListeners();
  }

  //
  void clearCart() {
    _cartList.clear();
    notifyListeners();
  }

  // is item in cart
  bool isItemInCart(String cId) {
    if (_cartList.containsKey(cId)) {
      return true;
    } else {
      return false;
    }
  }
}

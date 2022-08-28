import 'dart:io';

import 'package:app/models/cartModel.dart';
import 'package:app/models/productModel.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  Map<String, Cart> _cartList = {};
  Map<String, Cart> get cartList => _cartList;
  // total amount
  double get totalAmount {
    double total = 0.0;
    _cartList.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  // add to cart
  void addToCart(String pId, Product product) {
    if (_cartList.containsKey(pId)) {
      _cartList.update(
        pId,
        (value) => Cart(
          cartId: value.cartId,
          title: value.title,
          imageUrl: value.imageUrl,
          price: value.price,
          quantity: value.quantity,
        ),
      );
    } else {
      _cartList.putIfAbsent(
        pId,
        () => Cart(
            cartId: DateTime.now().toIso8601String(),
            title: product.title,
            imageUrl: product.imageUrl[0],
            price: product.price,
            quantity: 1),
      );
    }
    notifyListeners();
  }

  // decriment from cart item quantity
  void decrimentItem(String pId) {
    if (_cartList.containsKey(pId)) {
      _cartList.update(
        pId,
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
  void incrimentItem(String pId) {
    if (_cartList.containsKey(pId)) {
      _cartList.update(
        pId,
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
  void removeFromCart(String pId) {
    _cartList.remove(pId);
    notifyListeners();
  }

  //
  void clearCart() {
    _cartList.clear();
    notifyListeners();
  }
}

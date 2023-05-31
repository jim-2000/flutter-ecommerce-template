//
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  String id;
  String name;
  String img;
  double price;
  int quantity;
  Cart({
    required this.id,
    required this.name,
    required this.img,
    required this.price,
    required this.quantity,
  });

  Cart copyWith({
    String? id,
    String? name,
    String? img,
    double? price,
    int? quantity,
  }) {
    return Cart(
      id: id ?? this.id,
      name: name ?? this.name,
      img: img ?? this.img,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'img': img,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      img: map['img'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Cart(id: $id, name: $name, img: $img, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cart &&
        other.id == id &&
        other.name == name &&
        other.img == img &&
        other.price == price &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        img.hashCode ^
        price.hashCode ^
        quantity.hashCode;
  }
}

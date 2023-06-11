//
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class WishListModel with ChangeNotifier {
  final String wishId;
  final String title;
  final String imageUrl;
  final double price;
  WishListModel({
    required this.wishId,
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  WishListModel copyWith({
    String? wishId,
    String? title,
    String? imageUrl,
    double? price,
  }) {
    return WishListModel(
      wishId: wishId ?? this.wishId,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'wishId': wishId,
      'title': title,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  factory WishListModel.fromMap(Map<String, dynamic> map) {
    return WishListModel(
      wishId: map['wishId'] ?? '',
      title: map['title'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory WishListModel.fromJson(String source) =>
      WishListModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WishListModel(wishId: $wishId, title: $title, imageUrl: $imageUrl, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WishListModel &&
        other.wishId == wishId &&
        other.title == title &&
        other.imageUrl == imageUrl &&
        other.price == price;
  }

  @override
  int get hashCode {
    return wishId.hashCode ^
        title.hashCode ^
        imageUrl.hashCode ^
        price.hashCode;
  }
}

import 'package:flutter/cupertino.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final List<String> imageUrl;
  final String productCatagoryName;
  final String productBrandName;
  final String catagories;
  final int quantity;
  final bool isFavorite;
  final bool isPopular;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.productCatagoryName,
    required this.productBrandName,
    required this.quantity,
    required this.isFavorite,
    required this.isPopular,
    required this.catagories,
  });
}

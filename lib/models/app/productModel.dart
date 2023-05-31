import 'dart:convert';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

/**
 * "thumbnail": {
"url": "https://res.cloudinary.com/the-captaion/image/upload/v1684129109/stack-shop/tXsGnw3DooUnyNO0OB0Lj.png"
},
"_id": "6461c557229315feb17df198",
"name": "Night Bolt Shoe",
"description": "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
"sortdescription": "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham",
"slug": "night-bolt-shoe",
"size": [],
"color": [
"#e91e63",
"#388e3c",
"#1976d2",
"#000000"
],
"tags": [
"nike",
"shoe",
"man's",
"boys",
"style"
],
"images": [
{
"url": "https://res.cloudinary.com/the-captaion/image/upload/v1684129110/stack-shop/U3WDxoFVYrG26xcqpPd0x.png",
"_id": "6461c557229315feb17df199"
},
{
"url": "https://res.cloudinary.com/the-captaion/image/upload/v1684129110/stack-shop/iQFVI8BPwKX7tlJV4zjWg.png",
"_id": "6461c557229315feb17df19a"
}
],
"averageRating": 0,
"totalRatingCount": 0,
"totalSell": 0,
"vendorId": "stack-shop",
"vendorName": "jim",
"categoryId": "645f427d93d99d13139caebe",
"catagoryName": "shoe",
"catagoryImg": "{ url: 'https://res.cloudinary.com/the-captaion/image/upload/v1683964540/stack-shop/8oYCMco1z8UnUNjS4oExl.png' }",
"brand": "nike",
"price": 120,
"oldPrice": 160,
"vat": 5,
"freeDelivery": true,
"currentStock": 100,
"status": true,
"reviews": []
 * 
 */
class Product {
  final ThumbnailImg thumbnail;
  final String id;
  final String name;
  final String description;
  final String sortdescription;
  final String slug;
  final List<String> size;
  final List<String> color;
  final List<String> tags;
  final List<Img> images;
  final int averageRating;
  final int totalRatingCount;
  final int totalSell;
  final String vendorId;
  final String vendorName;
  final String categoryId;
  final String catagoryName;
  final String catagoryImg;
  final String brand;
  final int price;
  final int oldPrice;
  final int vat;
  final int currentStock;
  final bool freeDelivery;
  final bool status;
  final List reviews = [];
  Product({
    required this.thumbnail,
    required this.id,
    required this.name,
    required this.description,
    required this.sortdescription,
    required this.slug,
    required this.size,
    required this.color,
    required this.tags,
    required this.images,
    required this.averageRating,
    required this.totalRatingCount,
    required this.totalSell,
    required this.vendorId,
    required this.vendorName,
    required this.categoryId,
    required this.catagoryName,
    required this.catagoryImg,
    required this.brand,
    required this.price,
    required this.oldPrice,
    required this.vat,
    required this.currentStock,
    required this.freeDelivery,
    required this.status,
  });

  Product copyWith({
    ThumbnailImg? thumbnail,
    String? id,
    String? title,
    String? description,
    String? sortdescription,
    String? slug,
    List<String>? size,
    List<String>? color,
    List<String>? tags,
    List<Img>? images,
    int? averageRating,
    int? totalRatingCount,
    int? totalSell,
    String? vendorId,
    String? vendorName,
    String? categoryId,
    String? catagoryName,
    String? catagoryImg,
    String? brand,
    int? price,
    int? oldPrice,
    int? vat,
    int? currentStock,
    bool? freeDelivery,
    bool? status,
    List? reviews,
  }) {
    return Product(
      thumbnail: thumbnail ?? this.thumbnail,
      id: id ?? this.id,
      name: title ?? name,
      description: description ?? this.description,
      sortdescription: sortdescription ?? this.sortdescription,
      slug: slug ?? this.slug,
      size: size ?? this.size,
      color: color ?? this.color,
      tags: tags ?? this.tags,
      images: images ?? this.images,
      averageRating: averageRating ?? this.averageRating,
      totalRatingCount: totalRatingCount ?? this.totalRatingCount,
      totalSell: totalSell ?? this.totalSell,
      vendorId: vendorId ?? this.vendorId,
      vendorName: vendorName ?? this.vendorName,
      categoryId: categoryId ?? this.categoryId,
      catagoryName: catagoryName ?? this.catagoryName,
      catagoryImg: catagoryImg ?? this.catagoryImg,
      brand: brand ?? this.brand,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      vat: vat ?? this.vat,
      currentStock: currentStock ?? this.currentStock,
      freeDelivery: freeDelivery ?? this.freeDelivery,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'thumbnail': thumbnail.toJson(),
      'id': id,
      'name': name,
      'description': description,
      'sortdescription': sortdescription,
      'slug': slug,
      'size': size,
      'color': color,
      'tags': tags.toList(growable: false),
      'images': images.map((x) => x.toJson()).toList(),
      'averageRating': averageRating,
      'totalRatingCount': totalRatingCount,
      'totalSell': totalSell,
      'vendorId': vendorId,
      'vendorName': vendorName,
      'categoryId': categoryId,
      'catagoryName': catagoryName,
      'catagoryImg': catagoryImg,
      'brand': brand,
      'price': price,
      'oldPrice': oldPrice,
      'vat': vat,
      'currentStock': currentStock,
      'freeDelivery': freeDelivery,
      'status': status,
      'reviews': reviews,
    };
  }

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      thumbnail: ThumbnailImg.fromJson(map['thumbnail']),
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      sortdescription: map['sortdescription'] ?? '',
      slug: map['slug'] ?? '',
      size: List<String>.from(map['size']),
      color: List<String>.from(map['color']),
      tags: List<String>.from(map['tags']),
      images: List<Img>.from(map['images'].map((x) => Img.fromJson(x))),
      averageRating: map['averageRating'] ?? 0,
      totalRatingCount: map['totalRatingCount'] ?? 0,
      totalSell: map['totalSell'] ?? 0,
      vendorId: map['vendorId'] ?? '',
      vendorName: map['vendorName'] ?? '',
      categoryId: map['categoryId'] ?? '',
      catagoryName: map['catagoryName'] ?? '',
      catagoryImg: map['catagoryImg'],
      brand: map['brand'] ?? '',
      price: map['price']?.toInt() ?? 0,
      oldPrice: map['oldPrice']?.toInt() ?? 0,
      vat: map['vat']?.toInt() ?? 0,
      currentStock: map['currentStock']?.toInt() ?? 0,
      freeDelivery: map['freeDelivery'] ?? false,
      status: map['status'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Product(thumbnail: $thumbnail, id: $id, title: $name, description: $description, sortdescription: $sortdescription, slug: $slug, size: $size, color: $color, tags: $tags, images: $images, averageRating: $averageRating, totalRatingCount: $totalRatingCount, totalSell: $totalSell, vendorId: $vendorId, vendorName: $vendorName, categoryId: $categoryId, catagoryName: $catagoryName, catagoryImg: $catagoryImg, brand: $brand, price: $price, oldPrice: $oldPrice, vat: $vat, currentStock: $currentStock, freeDelivery: $freeDelivery, status: $status, reviews: $reviews)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Product &&
        other.thumbnail == thumbnail &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.sortdescription == sortdescription &&
        other.slug == slug &&
        listEquals(other.size, size) &&
        listEquals(other.color, color) &&
        listEquals(other.tags, tags) &&
        listEquals(other.images, images) &&
        other.averageRating == averageRating &&
        other.totalRatingCount == totalRatingCount &&
        other.totalSell == totalSell &&
        other.vendorId == vendorId &&
        other.vendorName == vendorName &&
        other.categoryId == categoryId &&
        other.catagoryName == catagoryName &&
        other.catagoryImg == catagoryImg &&
        other.brand == brand &&
        other.price == price &&
        other.oldPrice == oldPrice &&
        other.vat == vat &&
        other.currentStock == currentStock &&
        other.freeDelivery == freeDelivery &&
        other.status == status &&
        listEquals(other.reviews, reviews);
  }

  @override
  int get hashCode {
    return thumbnail.hashCode ^
        id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        sortdescription.hashCode ^
        slug.hashCode ^
        size.hashCode ^
        color.hashCode ^
        tags.hashCode ^
        images.hashCode ^
        averageRating.hashCode ^
        totalRatingCount.hashCode ^
        totalSell.hashCode ^
        vendorId.hashCode ^
        vendorName.hashCode ^
        categoryId.hashCode ^
        catagoryName.hashCode ^
        catagoryImg.hashCode ^
        brand.hashCode ^
        price.hashCode ^
        oldPrice.hashCode ^
        vat.hashCode ^
        currentStock.hashCode ^
        freeDelivery.hashCode ^
        status.hashCode ^
        reviews.hashCode;
  }
}

class ThumbnailImg {
  String url;
  ThumbnailImg({
    required this.url,
  });

  factory ThumbnailImg.fromJson(Map<String, dynamic> json) {
    return ThumbnailImg(
      url: json["url"] ??
          'https://placehold.co/600x400/gray/orange?font=No-image&text=No%20Image.png',
    );
  }

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class Img {
  String url;
  String id;
  Img({
    required this.id,
    required this.url,
  });

  factory Img.fromJson(Map<String, dynamic> json) {
    return Img(
      id: json["_id"],
      url: json["url"],
      // url: json["url"] ??
      //     'https://placehold.co/600x400/gray/orange?font=No-image&text=No%20Image.png',
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "url": url,
      };
}

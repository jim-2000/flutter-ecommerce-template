import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

Catagori catagoriFromJson(String str) => Catagori.fromJson(json.decode(str));

String catagoriToJson(Catagori data) => json.encode(data.toJson());

//
class Catagori {
  final String id;
  final String name;
  final String slug;
  final bool status;
  Img catagoriImage;
  Catagori({
    required this.id,
    required this.name,
    required this.slug,
    required this.status,
    required this.catagoriImage,
  });

  Catagori copyWith({
    String? id,
    String? name,
    String? slug,
    bool? status,
    Img? catagoriImage,
  }) {
    return Catagori(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      status: status ?? this.status,
      catagoriImage: catagoriImage ?? this.catagoriImage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'status': status,
      'catagoriImage': catagoriImage.toJson(),
    };
  }

  factory Catagori.fromMap(Map<String, dynamic> map) {
    return Catagori(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
      status: map['status'] ?? false,
      catagoriImage: Img.fromJson(map["catagoriImage"]),
    );
  }

  String toJson() => json.encode(toMap());

  factory Catagori.fromJson(Map<String, dynamic> json) => Catagori(
        id: json['_id'] ?? '',
        name: json['name'] ?? '',
        slug: json['slug'] ?? '',
        status: json['status'] ?? false,
        catagoriImage: Img.fromJson(json['catagoriImage']),
      );

  @override
  String toString() {
    return 'Catagori(id: $id, name: $name, slug: $slug, status: $status, catagoriImage: $catagoriImage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Catagori &&
        other.id == id &&
        other.name == name &&
        other.slug == slug &&
        other.status == status &&
        other.catagoriImage == catagoriImage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        slug.hashCode ^
        status.hashCode ^
        catagoriImage.hashCode;
  }
}

class Img {
  String url;
  Img({
    required this.url,
  });

  factory Img.fromJson(Map<String, dynamic> json) {
    return Img(
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

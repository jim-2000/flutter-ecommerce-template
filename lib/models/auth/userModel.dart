import 'dart:convert';

import 'package:flutter/cupertino.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User with ChangeNotifier {
  String username;
  String email;
  String img;
  String phone;
  String role;
  String id;

  User({
    required this.username,
    required this.email,
    required this.img,
    required this.phone,
    required this.role,
    required this.id,
  });

  User copyWith({
    String? id,
    String? username,
    String? email,
    String? img,
    String? phone,
    String? role,
  }) {
    return User(
      username: username ?? this.username,
      email: email ?? this.email,
      img: img ?? this.img,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'img': img,
      'phone': phone,
      'role': role,
      '_id': id,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] as String,
      email: json['email'] as String,
      img: json['img'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String,
      id: json['_id'] as String,
    );
  }
}

class LoginModel {
  final String email;
  final String password;

  LoginModel({
    required this.email,
    required this.password,
  });
  // from json
  LoginModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];
  // to json
  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}

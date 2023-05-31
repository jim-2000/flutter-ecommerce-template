import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:app/models/cartModel.dart';

class OrderModel with ChangeNotifier {
  final String id;
  final ShippingModel shippingInfo;
  final PaymentInfo paymentInfo;
  final String orderId;
  final OrderItems orderItems;
  final String user;
  final String username;
  final String email;
  final String paymentMethod;
  final String paidAt;

  final int totalItems;
  final int price;
  final int shippingPrice;
  final int totalPrice;
  final int orderStatus;

  final String createdAt;
  final String updatedAt;
  final String v;
  OrderModel({
    required this.id,
    required this.shippingInfo,
    required this.paymentInfo,
    required this.orderId,
    required this.orderItems,
    required this.user,
    required this.username,
    required this.email,
    required this.paymentMethod,
    required this.paidAt,
    required this.totalItems,
    required this.price,
    required this.shippingPrice,
    required this.totalPrice,
    required this.orderStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  OrderModel copyWith({
    String? id,
    ShippingModel? shippingInfo,
    PaymentInfo? paymentInfo,
    String? orderId,
    OrderItems? orderItems,
    String? user,
    String? username,
    String? email,
    String? paymentMethod,
    String? paidAt,
    int? totalItems,
    int? price,
    int? shippingPrice,
    int? totalPrice,
    int? orderStatus,
    String? createdAt,
    String? updatedAt,
    String? v,
  }) {
    return OrderModel(
      id: id ?? this.id,
      shippingInfo: shippingInfo ?? this.shippingInfo,
      paymentInfo: paymentInfo ?? this.paymentInfo,
      orderId: orderId ?? this.orderId,
      orderItems: orderItems ?? this.orderItems,
      user: user ?? this.user,
      username: username ?? this.username,
      email: email ?? this.email,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paidAt: paidAt ?? this.paidAt,
      totalItems: totalItems ?? this.totalItems,
      price: price ?? this.price,
      shippingPrice: shippingPrice ?? this.shippingPrice,
      totalPrice: totalPrice ?? this.totalPrice,
      orderStatus: orderStatus ?? this.orderStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'shippingInfo': shippingInfo.toMap(),
      'paymentInfo': paymentInfo.toMap(),
      'orderId': orderId,
      'orderItems': orderItems.toMap(),
      'user': user,
      'username': username,
      'email': email,
      'paymentMethod': paymentMethod,
      'paidAt': paidAt,
      'totalItems': totalItems,
      'price': price,
      'shippingPrice': shippingPrice,
      'totalPrice': totalPrice,
      'orderStatus': orderStatus,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'v': v,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] ?? '',
      shippingInfo: ShippingModel.fromMap(map['shippingInfo']),
      paymentInfo: PaymentInfo.fromMap(map['paymentInfo']),
      orderId: map['orderId'] ?? '',
      orderItems: OrderItems.fromMap(map['orderItems']),
      user: map['user'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      paymentMethod: map['paymentMethod'] ?? '',
      paidAt: map['paidAt'] ?? '',
      totalItems: map['totalItems']?.toInt() ?? 0,
      price: map['price']?.toInt() ?? 0,
      shippingPrice: map['shippingPrice']?.toInt() ?? 0,
      totalPrice: map['totalPrice']?.toInt() ?? 0,
      orderStatus: map['orderStatus']?.toInt() ?? 0,
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      v: map['v'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(id: $id, shippingInfo: $shippingInfo, paymentInfo: $paymentInfo, orderId: $orderId, orderItems: $orderItems, user: $user, username: $username, email: $email, paymentMethod: $paymentMethod, paidAt: $paidAt, totalItems: $totalItems, price: $price, shippingPrice: $shippingPrice, totalPrice: $totalPrice, orderStatus: $orderStatus, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderModel &&
        other.id == id &&
        other.shippingInfo == shippingInfo &&
        other.paymentInfo == paymentInfo &&
        other.orderId == orderId &&
        other.orderItems == orderItems &&
        other.user == user &&
        other.username == username &&
        other.email == email &&
        other.paymentMethod == paymentMethod &&
        other.paidAt == paidAt &&
        other.totalItems == totalItems &&
        other.price == price &&
        other.shippingPrice == shippingPrice &&
        other.totalPrice == totalPrice &&
        other.orderStatus == orderStatus &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        shippingInfo.hashCode ^
        paymentInfo.hashCode ^
        orderId.hashCode ^
        orderItems.hashCode ^
        user.hashCode ^
        username.hashCode ^
        email.hashCode ^
        paymentMethod.hashCode ^
        paidAt.hashCode ^
        totalItems.hashCode ^
        price.hashCode ^
        shippingPrice.hashCode ^
        totalPrice.hashCode ^
        orderStatus.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode;
  }
}

class ShippingModel {
  final String city;
  final String state;
  final String country;
  final String zipcode;
  final String phoneNo;
  final String address;
  ShippingModel({
    required this.city,
    required this.state,
    required this.country,
    required this.zipcode,
    required this.phoneNo,
    required this.address,
  });

  ShippingModel copyWith({
    String? city,
    String? state,
    String? country,
    String? zipcode,
    String? phoneNo,
    String? address,
  }) {
    return ShippingModel(
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      zipcode: zipcode ?? this.zipcode,
      phoneNo: phoneNo ?? this.phoneNo,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'state': state,
      'country': country,
      'zipcode': zipcode,
      'phoneNo': phoneNo,
      'address': address,
    };
  }

  factory ShippingModel.fromMap(Map<String, dynamic> map) {
    return ShippingModel(
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      country: map['country'] ?? '',
      zipcode: map['zipcode'] ?? '',
      phoneNo: map['phoneNo'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ShippingModel.fromJson(String source) =>
      ShippingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShippingModel(city: $city, state: $state, country: $country, zipcode: $zipcode, phoneNo: $phoneNo, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShippingModel &&
        other.city == city &&
        other.state == state &&
        other.country == country &&
        other.zipcode == zipcode &&
        other.phoneNo == phoneNo &&
        other.address == address;
  }

  @override
  int get hashCode {
    return city.hashCode ^
        state.hashCode ^
        country.hashCode ^
        zipcode.hashCode ^
        phoneNo.hashCode ^
        address.hashCode;
  }
}

class PaymentInfo {
  final String id;
  final String status;
  PaymentInfo({
    required this.id,
    required this.status,
  });

  PaymentInfo copyWith({
    String? id,
    String? status,
  }) {
    return PaymentInfo(
      id: id ?? this.id,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'status': status,
    };
  }

  factory PaymentInfo.fromMap(Map<String, dynamic> map) {
    return PaymentInfo(
      id: map['id'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentInfo.fromJson(String source) =>
      PaymentInfo.fromMap(json.decode(source));

  @override
  String toString() => 'PaymentInfo(id: $id, status: $status)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaymentInfo && other.id == id && other.status == status;
  }

  @override
  int get hashCode => id.hashCode ^ status.hashCode;
}

class OrderItems {
  String id;
  String oid;
  String name;
  String img;
  double price;
  int quantity;
  OrderItems({
    required this.id,
    required this.oid,
    required this.name,
    required this.img,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'oid': oid,
      'name': name,
      'img': img,
      'price': price,
      'quantity': quantity,
    };
  }

  factory OrderItems.fromMap(Map<String, dynamic> map) {
    return OrderItems(
      id: map['id'] ?? '',
      oid: map['_id'] ?? '',
      name: map['name'] ?? '',
      img: map['img'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItems.fromJson(String source) =>
      OrderItems.fromMap(json.decode(source));
}

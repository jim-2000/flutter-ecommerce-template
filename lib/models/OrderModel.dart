//
import 'package:app/models/cartModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

enum OrderStatus { pending, completed, canceled }

enum PaymentMethod { paypal, gpay, visa, creditcard, cashOnDelivery }

class OrderModel with ChangeNotifier {
  final String orderId = const Uuid().v4();
  OrderStatus orderStatus;
// product data
  final List<Cart> products;
  final double price;
// user id & vendor id
  final String userId;
  final String vendorId;
// payment
  final bool ispaymantDone;
  final String paymentId;
  final PaymentMethod paymentMethod;

  OrderModel({
    required this.products,
    required this.price,
    required this.ispaymantDone,
    required this.paymentId,
    required this.userId,
    required this.vendorId,
    required this.paymentMethod,
    required this.orderStatus,
  });
}
//


import 'package:app/models/OrderModel.dart';
import 'package:app/models/products.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider extends ChangeNotifier {
  final List<OrderModel> _order = [
    OrderModel(
      products: [],
      price: 200,
      ispaymantDone: false,
      paymentId: '45645610',
      userId: 'userId',
      vendorId: 'vendorId',
      paymentMethod: PaymentMethod.creditcard,
      orderStatus: OrderStatus.pending,
    ),
    OrderModel(
      products: [],
      price: 200,
      ispaymantDone: true,
      paymentId: '54562310.2sfa',
      userId: 'userId',
      vendorId: 'vendorId',
      paymentMethod: PaymentMethod.cashOnDelivery,
      orderStatus: OrderStatus.completed,
    ),
    OrderModel(
      products: [],
      price: 200,
      ispaymantDone: false,
      paymentId: 'paymentId',
      userId: 'userId',
      vendorId: 'vendorId',
      paymentMethod: PaymentMethod.cashOnDelivery,
      orderStatus: OrderStatus.pending,
    ),
  ];

  List<OrderModel> get order => _order;
  // completeOrde
  List<OrderModel> get completedOrder => _order
      .where((element) => element.orderStatus == OrderStatus.completed)
      .toList();
// ongoingOrder
  List<OrderModel> get ongoingOrder => _order
      .where((element) => element.orderStatus == OrderStatus.pending)
      .toList();

  // cancelOrder
  List<OrderModel> get cancelOrder => _order
      .where((element) => element.orderStatus == OrderStatus.canceled)
      .toList();

  void addOrder(OrderModel order) {
    _order.add(order);
    notifyListeners();
  }

  void cencellOrder(String id) {
    _order.removeWhere((element) =>
        element.orderId == id && element.orderStatus == "completed");
    notifyListeners();
  }

  void orderDone(String id) {
    final isOrderId = _order.any((element) => element.orderId == id);
    if (isOrderId) {
      _order.firstWhere((element) => element.orderId == id);
    }
    notifyListeners();
  }
  // completeOrder(String id)

}

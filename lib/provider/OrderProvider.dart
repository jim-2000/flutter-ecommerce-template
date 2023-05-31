import 'package:app/models/products.dart';
import 'package:app/models/app/orderModel.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderModel> _order = [];
  List<OrderModel> getOrders() => _order;
  //
  Future<void> setOrder(List<OrderModel> orderList) async {
    _order = orderList;
    notifyListeners();
  }
}

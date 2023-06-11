import 'package:app/models/enums/paymentEnums.dart';
import 'package:app/models/products.dart';
import 'package:app/models/app/orderModel.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider extends ChangeNotifier {
  bool isLoading = false;
  String _client_secret = '';
  String get client_secret => _client_secret;
  List<OrderModel> _order = [];
  List<OrderModel> getOrders() => _order;
  PaymentType _selectedPayment = PaymentType.cod;
  PaymentType get selectedPayment => _selectedPayment;
  //
  void updateClientSecret(String clientSecret) {
    if (clientSecret.length > 5) {
      _client_secret = clientSecret;
    }
    notifyListeners();
  }

  //
  void updateSelectPayment(PaymentType paymentType) {
    if (paymentType != _selectedPayment) {
      _selectedPayment = paymentType;
    }
    notifyListeners();
  }

  //
  Future<void> setOrder(List<OrderModel> orderList) async {
    _order = orderList;
    notifyListeners();
  }

//
  void startLoader() {
    isLoading = true;
    notifyListeners();
  }

  void stopLoader() {
    isLoading = false;
    notifyListeners();
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:app/api/call.dart';
import 'package:app/api/url.dart';
import 'package:app/models/app/orderModel.dart';
import 'package:app/models/cartModel.dart';
import 'package:app/provider/OrderProvider.dart';
import 'package:app/provider/auth/UserProvider.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/sf_utils.dart';
import 'package:app/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class OrderService {
  void getmyOrder(BuildContext context) async {
    final orderprovider = Provider.of<OrderProvider>(context, listen: false);
    try {
      String token = await fetchStringValuesSF("authToken");
      HeadersRawData headers = HeadersRawData(
        authorization: "Bearer $token",
        contentType: HeaderContentType.json,
      );
      http.Response res =
          await reqGetAPIMethod(Url.getmyOrder, apiHeaders: headers.toJson());
      if (res.statusCode == 200) {
        final json = jsonDecode(res.body);
        // final catagories = List.from(json)
        //     .map<OrderModel>((catagori) => OrderModel.fromJson(catagori))
        // .toList();
      }
      log(res.body.toString());
    } catch (e) {
      showSimpleNotification(
        msg: "",
        title: "Something went wrong",
        color: AppColors.AppPrimary,
      );
    }
  }

  //        orderItems,
  // shippingInfo,
  // itemsPrice,
  // shippingPrice,
  // totalPrice,
  // paymentToken,
  // paymentMethod,
  // paymentInfo,
  void newOrder(
    BuildContext context,
    // final order
    ShippingModel shippinginfo,
    PaymentInfo paymentInfo,
    List<Cart> cart,
    String? paymentToken,
    int paymentMethod,
  ) async {
    final orderprovider = Provider.of<OrderProvider>(context, listen: false);
    final authprovider = Provider.of<UserProvider>(context, listen: false).user;
    try {
      String token = await fetchStringValuesSF("authToken");
      HeadersRawData headers = HeadersRawData(
        authorization: "Bearer $token",
        contentType: HeaderContentType.json,
      );
      Map<String, dynamic> body = {
        'shippingInfo': shippinginfo,
        'paymentInfo': paymentInfo,
        'orderItems': cart,
        'paymentToken': paymentToken,
        'paymentMethod': paymentMethod,
        'shippingPrice': 4, // total items * $5
        'totalPrice': 'cart.totalPrice * cart.toatl items',
        'itemsPrice': 'cart.totalPrice',
      };
      http.Response res =
          await reqPostAPIMethod(Url.newOrder, headers.toJson(), {
        //
      });
      if (res.statusCode == 200) {
        showSimpleNotification(
          msg: '',
          title: 'Order successfully Placed',
        );
      }
      log(res.body.toString());
    } catch (e) {
      showSimpleNotification(
        msg: "",
        title: "Something went wrong",
        color: AppColors.AppPrimary,
      );
    }
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:app/api/call.dart';
import 'package:app/api/url.dart';
import 'package:app/models/app/orderModel.dart';
import 'package:app/models/cartModel.dart';
import 'package:app/provider/OrderProvider.dart';
import 'package:app/provider/productProvider.dart';
import 'package:app/provider/cartProvider.dart';
import 'package:app/screens/bottom_bar_Screen.dart';
import 'package:app/screens/order/PlaceOrder.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/navigation_utils.dart';
import 'package:app/utils/sf_utils.dart';
import 'package:app/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../widgets/order/ShippingInfo.dart';

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

  void newOrder(
    BuildContext context,
    // final order
    ShippingModel shippinginfo,
    PaymentInfo? paymentInfo,
    int paymentMethod,
  ) async {
    final orderprovider = Provider.of<OrderProvider>(context, listen: false);
    final cartprovider = Provider.of<CartProvider>(context, listen: false);
    final productprovider =
        Provider.of<ProductProvider>(context, listen: false);

    orderprovider.startLoader();
    if (cartprovider.cartList.isEmpty) {
      showSimpleNotification(
        msg: 'Cart is empty',
      );
    }
    try {
      final int shippingPrice = cartprovider.cartList.length * 5;
      final double totalPrice = cartprovider.totalAmount + shippingPrice;

      //
      final body = OrderFormModel(
        shippingInfo: shippinginfo,
        orderItems: cartprovider.cartList,
        itemsPrice: cartprovider.totalAmount.toInt(),
        shippingPrice: shippingPrice,
        totalPrice: totalPrice.toInt(),
        paymentMethod: paymentMethod,
        paymentInfo: paymentInfo,
      );
      http.Response res = await reqPostAPIMethodAuthorize(
        Url.newOrder,
        body.toJson(),
      );
      if (res.statusCode == 200) {
        // empty cart list
        cartprovider.clearCart();
        // clearlocal stores
        clearValueFromSF('cartList');
        // msg
        showSimpleNotification(
          msg: '',
          title: 'Order successfully Placed',
        );
        orderprovider.stopLoader();
        // routes home,
        pushNamedToReplace(routeName: BottomBarScreen.routeName);
      }
      if (res.statusCode == 404) {
        showSimpleNotification(
          msg: '',
          title: 'Somethings is wrong',
        );
        orderprovider.stopLoader();
      }
    } catch (e) {
      showSimpleNotification(
        msg: "",
        title: "Something went wrong",
        color: AppColors.AppPrimary,
      );
      orderprovider.stopLoader();
    }
  }

  //
  Future createPaymentIntent(
    BuildContext context,
  ) async {
    final orderprovider = Provider.of<OrderProvider>(context, listen: false);
    final cartprovider = Provider.of<CartProvider>(context, listen: false);
    try {
      orderprovider.startLoader();
      final amount = cartprovider.totalAmount.toInt() * 100;
      final body = jsonEncode({'amount': '${amount.round()}'});
      log(body);
      final res = await reqPostAPIMethodAuthorize(
        Url.paymentIntent,
        body,
      );
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body.toString());
        final String client = (data['client_secret'].toString());
        orderprovider.updateClientSecret(client);
        orderprovider.stopLoader();
      } else {
        showSimpleNotification(
          title: 'Payment failed',
          msg: '',
        );
        orderprovider.stopLoader();

        pushNamedToReplace(routeName: PlaceOrder.routeName);
      }
    } catch (e) {
      orderprovider.stopLoader();
      log(e.toString());
      showSimpleNotification(
        msg: "Something went wrong",
        title: "Try again",
        color: AppColors.AppPrimary,
      );
    }
  }

  // payment Now
  Future paynow(
    BuildContext context,
  ) async {
    final orderprovider = Provider.of<OrderProvider>(context, listen: false);

    try {
      //
    } catch (e) {
      orderprovider.stopLoader();
      log(e.toString());
      showSimpleNotification(
        msg: "Something went wrong",
        title: "Try again",
        color: AppColors.AppPrimary,
      );
    }
  }
}

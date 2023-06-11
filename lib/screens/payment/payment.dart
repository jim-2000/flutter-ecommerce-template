import 'dart:developer';

import 'package:app/provider/OrderProvider.dart';
import 'package:app/services/app/orderService.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentScreen extends StatefulWidget {
  static String routeName = '/payment';
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final orderService = OrderService();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      orderService.createPaymentIntent(context);
    });
  }

  //
  @override
  Widget build(BuildContext context) {
    // provider
    final orderprovider = Provider.of<OrderProvider>(context);

    Future displaypayment() async {
      try {
        await Stripe.instance.presentPaymentSheet().then((va) => {});
      } catch (e) {
        log("Fail");
      }
    }

    void payNow() async {
      try {
        await Stripe.instance
            .initPaymentSheet(
                paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: orderprovider.client_secret,
              // billingDetails: BillingDetails(
              //   phone: _phoneNumberController.text,
              //   email: userrProv.user.email,
              //   name: userrProv.user.username,
              // ),
              merchantDisplayName: 'Easy Shop',
              style: ThemeMode.system,
            ))
            .then((value) => {displaypayment()});
      } catch (e) {
        showSimpleNotification(msg: '', title: 'Payment failed');
      }
    }

    return Consumer<OrderProvider>(builder: (context, val, _) {
      return val.isLoading
          ? Scaffold(
              body: Center(
                child: SizedBox(
                  height: 25,
                  child: LoadingIndicator(
                      indicatorType: Indicator.ballSpinFadeLoader,
                      strokeWidth: 4,
                      colors: [AppColors.AppPrimary]),
                ),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                title: const Text('Payment Screen'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Consumer<OrderProvider>(
                    builder: (context, val, _) {
                      return ElevatedButton(
                          onPressed: () async {
                            payNow();
                          },
                          child: Text("Pay Now "));
                    },
                  ),
                ),
              ),
            );
    });
  }
}

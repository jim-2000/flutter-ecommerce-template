import 'package:app/models/OrderModel.dart';
import 'package:app/provider/OrderProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatelessWidget {
  static String routeName = '/payment';
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    print(arg['productid']);
    print(arg['productprice']);
    // provider
    final orderprovider = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Screen'),
      ),
      body: Center(
        child: Text('Payment Screen'),
      ),
    );
  }
}

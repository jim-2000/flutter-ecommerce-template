// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:app/animations/fadeAnimation.dart';

import 'package:app/provider/OrderProvider.dart';
import 'package:app/screens/order/OngoingOrderCard.dart';
import 'package:app/utils/apputils.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = '/OrderScreen';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// app utils

    final sizes = Utils(context).getScreenSize;
    // provider
    final orderprovider = Provider.of<OrderProvider>(context);
    //
    final animated = AnimatedCard();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order Screen'),
          bottom: TabBar(
            tabs: const [
              Tab(
                text: 'Ongoing',
                icon: Icon(Icons.home_outlined),
              ),
              Tab(
                icon: Icon(Icons.car_repair_rounded),
                text: 'Completd Order Card',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Center(child: Text('Onging Order Card')),
            ),
            Container(
              child: Center(child: Text('Complete Order Card')),
            ),
          ],
        ),
      ),
    );
  }
}

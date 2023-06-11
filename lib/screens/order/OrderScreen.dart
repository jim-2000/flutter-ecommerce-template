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
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             const Text(
        //               "My Order",
        //               style: TextStyle(
        //                 fontSize: 22,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //             const SizedBox(
        //               width: 20,
        //             ),
        //             TextButton(
        //               onPressed: () {},
        //               // ignore: sort_child_properties_last
        //               child: Text(
        //                 'Ongoing',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 18,
        //                 ),
        //               ),
        //               style: TextButton.styleFrom(
        //                 backgroundColor: Colors.black,
        //                 padding: const EdgeInsets.symmetric(
        //                     horizontal: 20, vertical: 10),
        //                 elevation: 6,
        //               ),
        //             ),
        //             TextButton(
        //               onPressed: () {},
        //               // ignore: sort_child_properties_last
        //               child: Text(
        //                 "Completed",
        //                 style: TextStyle(
        //                   color: Colors.grey,
        //                 ),
        //               ),
        //               style: TextButton.styleFrom(
        //                 backgroundColor: Colors.white,
        //                 padding: const EdgeInsets.symmetric(
        //                     horizontal: 20, vertical: 10),
        //                 elevation: 6,
        //               ),
        //             ),
        //           ],
        //         ),
        //         SizedBox(
        //           height: 20,
        //         ),
        //         orderprovider.ongoingOrder.isNotEmpty
        //             ? SizedBox(
        //                 height: sizes.height * 0.8,
        //                 child: ListView.builder(
        //                   itemBuilder: (context, i) {
        //                     final order = orderprovider.ongoingOrder.toList()[i];
        //                     return ChangeNotifierProvider.value(
        //                       value: order,
        //                       child: ZoomIn(
        //                         animate: true,
        //                         delay: Duration(
        //                           microseconds: i * 100,
        //                         ),
        //                         duration: Duration(seconds: 2),
        //                         child: OngoingOrderCard(),
        //                       ),
        //                     );
        //                   },
        //                   itemCount: orderprovider.ongoingOrder.length,
        //                 ),
        //               )
        //             : SizedBox(
        //                 height: sizes.height * 0.8,
        //                 child: Center(
        //                   child: EmptyWidget(
        //                     image: null,
        //                     packageImage: PackageImage.Image_1,
        //                     title: 'Empty Order',
        //                     subTitle: 'No  wishlist available yet',
        //                     titleTextStyle: const TextStyle(
        //                       fontSize: 22,
        //                       color: Color(0xff9da9c7),
        //                       fontWeight: FontWeight.w500,
        //                     ),
        //                     subtitleTextStyle: const TextStyle(
        //                       fontSize: 14,
        //                       color: Color(0xffabb8d6),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

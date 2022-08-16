import 'dart:developer';

import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/widgets/cart/CartItem.dart';
import 'package:app/widgets/cart/emptyCart.dart';
import 'package:app/widgets/home/feedWidget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final sizes = Utils(context).getScreenSize;
    List<Map<String, dynamic>> cartItem = [
      {
        'imgPath': 'assets/images/cat/fruits.png',
        'catText': 'Fruits',
      },
      {
        'imgPath': 'assets/images/cat/veg.png',
        'catText': 'Vegetables',
      },
      {
        'imgPath': 'assets/images/cat/Spinach.png',
        'catText': 'Herbs',
      },
      {
        'imgPath': 'assets/images/cat/nuts.png',
        'catText': 'Nuts',
      },
      {
        'imgPath': 'assets/images/cat/spices.png',
        'catText': 'Spices',
      },
      {
        'imgPath': 'assets/images/cat/grains.png',
        'catText': 'Grains',
      },
      {
        'imgPath': 'assets/images/cat/fruits.png',
        'catText': 'Fruits',
      },
      {
        'imgPath': 'assets/images/cat/veg.png',
        'catText': 'Vegetables',
      },
      {
        'imgPath': 'assets/images/cat/Spinach.png',
        'catText': 'Herbs',
      },
    ];
    final List cartList = [];
    return cartItem.isEmpty
        ? EmptyCard(
            imgss: cartItem[0]['imgPath'],
            title: "Your Cart is empty Try shopping",
            subtitle:
                "Please add something on your cart then checkout get more discount",
            onButtonTap: () {
              log("empty cart button tapped");
            },
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.AppPrimary,
              title: const Text("CART ${10}"),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.black,
                    ))
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: _listtitle(title: "Your Cart Item", view: ''),
                      ),
                    ),
                    SizedBox(
                      height: sizes.height * 0.65,
                      child: ListView.builder(
                        itemBuilder: (context, i) {
                          return CartIdtem(
                              name: cartItem[i]['catText'],
                              img: cartItem[i]['imgPath']);
                        },
                        itemCount: cartItem.length,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //
                    const SizedBox(
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: _listtitle(title: "You may also Like"),
                      ),
                    ),
                    // List view
                    SizedBox(
                      height: sizes.height * 0.24,
                      width: sizes.width,
                      child: ListView.builder(
                        itemBuilder: (ctx, i) {
                          return const Card(
                            elevation: 20,
                            child: FeeedWidget(),
                          );
                        },
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    //
                  ],
                ),
              ),
            ),
            bottomSheet: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: theme ? Colors.black : AppColors.AppBg,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$500.00",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: theme ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          "view Details",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.AppPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(MediaQuery.of(context).size.width / 3, 55),
                          primary: AppColors.AppPrimary,
                        ),
                        onPressed: () {},
                        child: Text(
                          "Place order".toUpperCase(),
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

///
class _listtitle extends StatelessWidget {
  const _listtitle({
    Key? key,
    required this.title,
    this.view,
  }) : super(key: key);
  final String title;
  final String? view;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Text(
          view ?? 'View all',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}

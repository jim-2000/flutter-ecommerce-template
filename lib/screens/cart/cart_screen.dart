import 'dart:developer';

import 'package:app/models/cartModel.dart';
import 'package:app/provider/cartProvider.dart';
import 'package:app/provider/productProvider.dart';
import 'package:app/screens/bottom_bar_Screen.dart';
import 'package:app/screens/order/PlaceOrder.dart';
import 'package:app/screens/payment/payment.dart';
import 'package:app/services/app/orderService.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/utils/navigation_utils.dart';
import 'package:app/widgets/cart/CartItem.dart';
import 'package:app/widgets/cart/emptyCart.dart';
import 'package:app/widgets/home/feedWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = '/cartScreen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final orderservice = OrderService();
  @override
  void initState() {
    // orderservice.getmyOrder(context);
    // TODO: implement initState
    super.initState();
  }

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

    // provider
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final ProductProvider latestProduct = Provider.of<ProductProvider>(context);

    //
    return cartProvider.cartList.isEmpty
        ? Scaffold(
            body: EmptyCard(
              imgss: cartItem[0]['imgPath'],
              title: "Your Cart is empty Try shopping",
              subtitle:
                  "Please add something on your cart then checkout get more discount",
              onButtonTap: () {
                Navigator.of(context).pushNamed(BottomBarScreen.routeName);
              },
            ),
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Consumer<CartProvider>(
                builder: (context, cp, _) {
                  return Text("CART ${cartProvider.cartList.length}");
                },
              ),
              actions: [
                InkWell(
                  onTap: () {
                    cartProvider.clearCart();
                  },
                  child: Tooltip(
                    enableFeedback: true,
                    message: "clear cart",
                    textStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 12,
                    ),
                    child: const Icon(
                      Icons.delete_forever_outlined,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
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
                          final cartItem = cartProvider.cartList[i];

                          return ChangeNotifierProvider.value(
                            value: cartItem,
                            child: FadeIn(
                              animate: true,
                              duration: const Duration(seconds: 2),
                              delay: Duration(microseconds: i * 100),
                              child: CartIdtem(
                                cartPId: cartItem.id,
                              ),
                            ),
                          );
                        },
                        itemCount: cartProvider.cartList.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomSheet: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: theme ? Colors.black : AppColors.AppBg,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$ ${cartProvider.totalAmount}",
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(MediaQuery.of(context).size.width / 3, 55),
                          backgroundColor: AppColors.AppPrimary,
                        ),
                        onPressed: () {
                          pushNamedOnlyTo(routeName: PlaceOrder.routeName);
                        },
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

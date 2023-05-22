import 'dart:developer';
import 'package:app/models/productModel.dart';
import 'package:app/models/products.dart';
import 'package:app/models/wishlistModel.dart';
import 'package:app/provider/cartProvider.dart';
import 'package:app/provider/productProvider.dart';
import 'package:app/provider/wishListProvider.dart';
import 'package:app/screens/cart/cart_screen.dart';
import 'package:app/screens/wishlist/wishlist.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/widgets/catagory/thumbCatagory_widget.dart';
import 'package:app/widgets/home/feedWidget.dart';
import 'package:badges/badges.dart' as badges;
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);
  static const String routeName = '/details';
//
  List<String> catagoies = [
    "assets/images/offres/women.jpg",
    "assets/images/offres/phone.jpg",
    'assets/images/cat/fruits.png'
  ];
  //
  @override
  Widget build(BuildContext context) {
// app utils
    String imgs = catagoies[0];
    final theme = Utils(context).getTheme;
    final sizes = Utils(context).getScreenSize;
    // provider and services or model
    final List<Product> products = Provider.of<ProductProvider>(context)
        .getallProduct()
        .getRange(0, 10)
        .toList();
    final productId = ModalRoute.of(context)!.settings.arguments;
    final Product product = Provider.of<ProductProvider>(context)
        .getProductById(productId.toString());
    // wishlist provider
    final WishListProvider wishlist = Provider.of<WishListProvider>(context);
    // cart provider
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final discount = product.price * 20 / 100;
    final newPrice = product.price - discount;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title.toUpperCase(),
        ),
        actions: [
          Consumer<WishListProvider>(builder: (context, wp, _) {
            return badges.Badge(
              badgeAnimation: const badges.BadgeAnimation.slide(),
              badgeContent: Text(
                wishlist.wishList.length.toString(),
                style: TextStyle(fontSize: 8),
              ),
              position: badges.BadgePosition.topEnd(top: 5, end: 7),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(WishlistScreen.routeName);
                },
                icon: const Icon(
                  Icons.favorite_border_outlined,
                ),
              ),
            );
          }),
          Consumer<CartProvider>(builder: (context, cp, _) {
            return badges.Badge(
              badgeAnimation: const badges.BadgeAnimation.slide(),
              badgeContent: Text(
                cartProvider.cartList.length.toString(),
                style: TextStyle(fontSize: 8),
              ),
              position: badges.BadgePosition.topEnd(top: 5, end: 7),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: const Icon(
                  Icons.shopping_cart_checkout_outlined,
                ),
              ),
            );
          }),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              // child: Image.asset(imgs, fit: BoxFit.cover),\
              child: Swiper(
                itemCount: product.imageUrl.length,
                autoplay: false,
                // control: const SwiperControl(),
                pagination: product.imageUrl.length > 2
                    ? const SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                          activeColor: Colors.white,
                          color: Colors.blueGrey,
                        ),
                      )
                    : null,
                itemBuilder: (context, i) {
                  return Image.network(
                    product.imageUrl[i],
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: sizes.height * 0.4),
              decoration: BoxDecoration(
                // color: Colors.white54,
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Wow shop 124 Dubai ",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.deepPurple,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: AppColors.AppPrimary,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: AppColors.AppPrimary,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: AppColors.AppPrimary,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: AppColors.AppPrimary,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: AppColors.AppPrimary,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "(150 reviews)",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              child: IconButton(
                                onPressed: () {
                                  wishlist.addToWishList(
                                    productId.toString(),
                                    product,
                                  );
                                },
                                icon: Icon(
                                  wishlist.isInWishList(product.id)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.share),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                product.title,
                                style: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$ ${newPrice.truncateToDouble()}",
                                  style: const TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "\$ ${product.price}",
                                  style: const TextStyle(
                                    textBaseline: TextBaseline.alphabetic,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Text(
                                  "(${20}% off)",
                                  style: TextStyle(
                                    textBaseline: TextBaseline.alphabetic,
                                    fontSize: 21,
                                    color: Colors.deepOrangeAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                            height: 1,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            product.description,
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                            height: 1,
                          ),
                        ),
                        _detailsProducts(
                          title: "Brand",
                          titleDetails: product.productBrandName,
                        ),
                        _detailsProducts(
                          title: "Quantity",
                          titleDetails: "${product.quantity - 10} left",
                        ),
                        _detailsProducts(
                          title: "Catagory",
                          titleDetails: product.productCatagoryName,
                        ),
                        _detailsProducts(
                          title: "Popularity",
                          titleDetails: "${product.quantity}+ reviews",
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                            height: 1,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          // color: Colors.black54,
                          width: double.infinity,
                          child: product.quantity < 5
                              ? Column(
                                  children: const [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "No Reviews yet",
                                      style: TextStyle(
                                        fontSize: 21,
                                      ),
                                    ),
                                    Text(
                                      "Be The first To Review!",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 70,
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                      thickness: 1,
                                      height: 1,
                                    ),
                                  ],
                                )
                              : Column(
                                  children: const [
                                    Card(
                                      elevation: 5,
                                      child: ListTile(
                                        title: Text("John Doe"),
                                        subtitle: Text("It's really nice"),
                                        trailing: Text("1 hour ago"),
                                        leading: CircleAvatar(
                                          child: Icon(Icons.person),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        "Suggested Products",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizes.height * 0.24,
                      width: double.infinity,
                      child: ListView.builder(
                        itemBuilder: (ctx, i) {
                          return Card(
                            elevation: 20,
                            child: FeeedWidget(
                              products: products[i],
                            ),
                          );
                        },
                        itemCount: products.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: _bottomSheet(
        onPressed: () {
          wishlist.addToWishList(product.id, product);
        },
        addtoCart: () {
          cartProvider.addToCart(product.id, product);
        },
        buyNOw: () => Navigator.of(context).pushNamed(
          CartScreen.routeName,
        ),
        icon: wishlist.isInWishList(product.id)
            ? Icons.favorite
            : Icons.favorite_border_outlined,
      ),
    );
  }
}

class _detailsProducts extends StatelessWidget {
  String title;
  String titleDetails;
  _detailsProducts({
    Key? key,
    required this.title,
    required this.titleDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        child: ListTile(
          leading: Text(
            title,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
          title: Text(
            titleDetails,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}

class _bottomSheet extends StatelessWidget {
  _bottomSheet({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.addtoCart,
    required this.buyNOw,
  }) : super(key: key);

  VoidCallback onPressed;
  VoidCallback addtoCart;
  VoidCallback buyNOw;

  IconData icon;
  @override
  Widget build(BuildContext context) {
    // final isWished = wishlistProvider.getWishlist.containsKey(productId);
    final WishListProvider wishlist = Provider.of<WishListProvider>(context);
    // cart provider
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.pinkAccent,
            height: 50,
            child: Center(
              child: TextButton(
                onPressed: addtoCart,
                child: const Text(
                  "ADD TO CART",
                  style: const TextStyle(fontSize: 28, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.white,
            height: 50,
            child: Center(
              child: TextButton(
                onPressed: buyNOw,
                child: const Text(
                  "BUY NOW",
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.grey.withOpacity(0.2),
            height: 50,
            child: Center(
              child: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  icon,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

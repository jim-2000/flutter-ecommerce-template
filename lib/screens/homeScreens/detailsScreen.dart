import 'dart:developer';
import 'package:app/models/app/productModel.dart';

import 'package:app/provider/cartProvider.dart';
import 'package:app/provider/productProvider.dart';
import 'package:app/provider/wishListProvider.dart';
import 'package:app/screens/cart/cart_screen.dart';
import 'package:app/screens/wishlist/wishlist.dart';
import 'package:app/services/app/productService.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/widgets/home/feedWidget.dart';
import 'package:badges/badges.dart' as badges;
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/details';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final productService = ProductService();

  //
  @override
  Widget build(BuildContext context) {
// app utils

    final sizes = Utils(context).getScreenSize;
    // provider and services or model
    final List<Product> products =
        Provider.of<ProductProvider>(context).product();

    final productId = ModalRoute.of(context)!.settings.arguments;
    final Product product = Provider.of<ProductProvider>(context)
        .getProductById(productId.toString());
    // wishlist provider
    final WishListProvider wishlist = Provider.of<WishListProvider>(context);
    // cart provider
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final discount = product.oldPrice * 20 / 100;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name.toUpperCase(),
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
                itemCount: product.images.length,
                autoplay: false,
                // control: const SwiperControl(),
                pagination: product.images.length > 1
                    ? const SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                          activeColor: Colors.white,
                          color: Colors.blueGrey,
                        ),
                      )
                    : null,
                itemBuilder: (context, i) {
                  return InteractiveViewer(
                    minScale: 1.2,
                    maxScale: 4,
                    child: FancyShimmerImage(
                      imageUrl: product.images[i].url,
                      boxFit: BoxFit.cover,
                      errorWidget: Text(product.name),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: sizes.height * 0.4),
              decoration: BoxDecoration(
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
                            Text(
                              '${product.name.substring(0, product.name.length > 20 ? 20 : product.name.length)}...',
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 3,
                              softWrap: true,
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
                                    product,
                                  );
                                },
                                icon: Icon(
                                  wishlist.isItemInWish(product.id)
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
                                product.name,
                                style: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$${product.price.truncateToDouble()}",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.AppPrimary,
                                  ),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  "\$ ${product.oldPrice}",
                                  style: const TextStyle(
                                    textBaseline: TextBaseline.alphabetic,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "(-$discount% off)",
                                  style: const TextStyle(
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
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              product.description,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
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
                          titleDetails: product.brand,
                        ),
                        _detailsProducts(
                          title: "Quantity",
                          titleDetails: "${product.currentStock} left",
                        ),
                        _detailsProducts(
                          title: "Catagory",
                          titleDetails: product.catagoryName,
                        ),
                        _detailsProducts(
                          title: "Popularity",
                          titleDetails: "${product.currentStock * 2} +reviews",
                        ),
                        _detailsProducts(
                          title: "Vendor Name",
                          titleDetails: "${product.vendorName.toUpperCase()} ",
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
                          child: product.currentStock < 5
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
                      child: Text(
                        "Suggested Products",
                        style: TextStyle(
                          color: Colors.grey.shade300,
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
          wishlist.addToWishList(product);
        },
        addtoCart: () {
          cartProvider.addToCart(product.id, product);
        },
        buyNOw: () => Navigator.of(context).pushNamed(
          CartScreen.routeName,
        ),
        icon: wishlist.isItemInWish(product.id)
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

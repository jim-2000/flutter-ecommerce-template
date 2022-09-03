import 'package:app/provider/cartProvider.dart';
import 'package:app/provider/productProvider.dart';
import 'package:app/provider/wishListProvider.dart';
import 'package:app/screens/cart/cart_screen.dart';
import 'package:app/screens/wishlist/wishlist.dart';
import 'package:app/widgets/cart/emptyCart.dart';
import 'package:app/widgets/home/feedWidget.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatagoryProduct extends StatelessWidget {
  static final String routeName = '/catagoryProduct';
  const CatagoryProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catagoryName = ModalRoute.of(context)!.settings.arguments as String;
    // product provider
    final ProductProvider productProvider =
        Provider.of<ProductProvider>(context);
    // wishlist provider
    final WishListProvider wishlist = Provider.of<WishListProvider>(context);
    // cart provider
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    //
    final catagoryProduct = productProvider.getProductByCategory(catagoryName);
    return Scaffold(
      appBar: AppBar(
        title: Text(catagoryName),
        actions: [
          Consumer<WishListProvider>(builder: (context, wp, _) {
            return Badge(
              toAnimate: true,
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(wishlist.wishList.length.toString()),
              position: BadgePosition.topEnd(top: 5, end: 7),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(WishlistScreen.routeName);
                },
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.deepPurple,
                ),
              ),
            );
          }),
          Consumer<CartProvider>(builder: (context, cp, _) {
            return Badge(
              toAnimate: true,
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(cartProvider.cartList.length.toString()),
              position: BadgePosition.topEnd(top: 5, end: 7),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.deepPurple,
                ),
              ),
            );
          }),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: catagoryProduct.isNotEmpty
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, i) {
                  return FeeedWidget(
                    products: catagoryProduct[i],
                  );
                },
                itemCount: catagoryProduct.length,
              )
            : EmptyCard(
                imgss: "assets/images/cat/fruits.png",
                title: "$catagoryName Catagory is empty",
                buttonTitle: "Go to Home",
                onButtonTap: () {
                  Navigator.pop(context);
                },
              ),
      ),
    );
  }
}

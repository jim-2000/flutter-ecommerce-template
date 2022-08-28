import 'package:app/models/productModel.dart';
import 'package:app/provider/cartProvider.dart';
import 'package:app/provider/wishListProvider.dart';
import 'package:app/screens/homeScreens/detailsScreen.dart';
import 'package:app/utils/apputils.dart';
import 'package:badges/badges.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeeedWidget extends StatelessWidget {
  const FeeedWidget({Key? key, required this.products}) : super(key: key);
  final Product products;

  @override
  Widget build(BuildContext context) {
    // >>>>>>>>>> app utils

    final size = Utils(context).getScreenSize;
    final theme = Utils(context).getTheme;

    // >>>>>>>>>> provider
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final WishListProvider wishListProvider =
        Provider.of<WishListProvider>(context);

    //
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(DetailsScreen.routeName, arguments: products.id);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FancyShimmerImage(
                    imageUrl: products.imageUrl[0],
                    width: 200,
                    height: size.width * 0.18,
                    boxFit: BoxFit.cover,
                  ),
                  Text(
                    products.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    products.catagories,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "\$ ${products.price}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    // this row for  future dev if you need to add more data
                    children: const [
                      Text(
                        "4.5",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.deepOrange,
                        size: 10,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.deepOrange,
                        size: 10,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.deepOrange,
                        size: 10,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.deepOrange,
                        size: 10,
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                  child: IconButton(
                      onPressed: () {
                        wishListProvider.addToWishList(products.id, products);
                      },
                      icon: Icon(
                        wishListProvider.wishList.containsKey(products.id)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.redAccent,
                      )),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                  child: IconButton(
                      onPressed: () {
                        cartProvider.addToCart(products.id, products);
                      },
                      icon: Icon(
                        cartProvider.cartList.containsKey(products.id)
                            ? Icons.shopping_cart
                            : Icons.add_shopping_cart,
                        color: Colors.deepOrange,
                      )),
                ),
              ),
              Badge(
                toAnimate: true,
                animationType: BadgeAnimationType.fade,
                animationDuration: Duration(milliseconds: 950),
                shape: BadgeShape.square,
                borderRadius: BorderRadius.circular(0),
                badgeContent: Text(
                  "New",
                  style: TextStyle(color: Colors.white),
                ),
                badgeColor: Colors.deepPurpleAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

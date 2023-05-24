import 'package:app/models/productModel.dart';
import 'package:app/models/products.dart';
import 'package:app/provider/cartProvider.dart';
import 'package:app/provider/catagoriProvider.dart';
import 'package:app/provider/wishListProvider.dart';
import 'package:app/screens/cart/cart_screen.dart';
import 'package:app/screens/wishlist/wishlist.dart';
import 'package:app/services/app/catagoriService.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/widgets/catagory/catagorytwo.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  static final String routeName = '/catagories';

  Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final catagoriService = CatagoriServices();
  List<Map<String, dynamic>> catagoies = [
    // {
    //   'img': 'assets/images/offres/women.jpg"',
    //   'title': 'Women',
    //   'description': "T-shirt Tops & Bottoms"
    // },
    // {
    //   'img': 'assets/images/offres/phone.jpg"',
    //   'title': 'Electronics',
    //   'description': "Mobile Phone laptop & elctronics"
    // },
    {
      'img': 'assets/images/cat/fruits.png',
      'title': 'Fruits',
      'description': "Fruits "
    },
    {
      'img': 'assets/images/cat/veg.png',
      'title': 'Vegetables',
      'description': "Vegetables "
    },
    {
      'img': 'assets/images/cat/Spinach.png',
      'title': 'Herbs',
      'description': " Herbs and Green Food "
    },
    {
      'img': 'assets/images/cat/nuts.png',
      'title': 'Nuts',
      'description': "Coocking Assesment "
    },
    {
      'img': 'assets/images/cat/spices.png',
      'title': 'Spices',
      'description': " Shoes and Assesment "
    },
    {
      'img': 'assets/images/cat/grains.png',
      'title': 'Grains',
      'description': " Grains and Assesment "
    },
    {
      'img': 'assets/images/cat/fruits.png',
      'title': 'Fruits',
      'description': "Fruits "
    },
    {
      'img': 'assets/images/cat/veg.png',
      'title': 'Vegetables',
      'description': "Vegetables "
    },
    {
      'img': 'assets/images/cat/Spinach.png',
      'title': 'Herbs',
      'description': " Herbs and Green Food "
    },
    {
      'img': 'assets/images/cat/nuts.png',
      'title': 'Nuts',
      'description': "Coocking Assesment "
    },
    {
      'img': 'assets/images/cat/spices.png',
      'title': 'Spices',
      'description': " Shoes and Assesment "
    },
    {
      'img': 'assets/images/cat/grains.png',
      'title': 'Grains',
      'description': " Grains and Assesment "
    },
  ];

//
  @override
  void initState() {
    super.initState();
    catagoriService.getAllCategories(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final List<Product> products = Products.products;
    // wishlist provider
    final WishListProvider wishlist = Provider.of<WishListProvider>(context);
    // cart provider
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final CatagoriProvider _catagoriProvider =
        Provider.of<CatagoriProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        actions: [
          Consumer<WishListProvider>(builder: (context, wp, _) {
            return badges.Badge(
              badgeAnimation: const badges.BadgeAnimation.slide(),
              badgeContent: Text(
                wishlist.wishList.length.toString(),
                style: const TextStyle(color: Colors.black),
              ),
              position: badges.BadgePosition.topEnd(top: 5, end: 7),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(WishlistScreen.routeName);
                },
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: AppColors.AppPrimary,
                ),
              ),
            );
          }),
          Consumer<CartProvider>(builder: (context, cp, _) {
            return badges.Badge(
              badgeAnimation: const badges.BadgeAnimation.slide(),
              badgeContent: Text(
                cartProvider.cartList.length.toString(),
                style: const TextStyle(color: Colors.black),
              ),
              position: badges.BadgePosition.topEnd(top: 5, end: 7),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.AppPrimary,
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
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (context, i) {
            return SizedBox(
              height: size.height * 0.24,
              // Animate hare --------------------------------
              child: CatagorytwoWidget(
                cata: _catagoriProvider.allCatagories[i],
                isRight: i.isOdd,
              ),
            );
          },
          itemCount: _catagoriProvider.allCatagories.length,
        ),
      ),
    );
  }
}

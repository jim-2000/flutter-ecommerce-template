import 'package:app/models/productModel.dart';
import 'package:app/models/products.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/widgets/catagory/catagorytwo.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);

//
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
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final size = Utils(context).getScreenSize;
    final List<Product> products = Products.products;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_outlined,
              color: AppColors.AppPrimary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.AppPrimary,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (context, i) {
            return CatagorytwoWidget(
              product: products[i],
              isRight: i.isOdd,
            );
          },
          itemCount: products.length,
        ),
      ),
    );
  }
}

 

/**
 * 
 *         child: SingleChildScrollView(
          child: Column(
            children: [
              CatagorytwoWidget(
                  title: "assets/images/offres/phone.jpg",
                  image: "ELECTRONICS",
                  description: "Mobile Phones & Tablets",
                  ontap: () {}),
              CatagorytwoWidget(
                  title: "assets/images/offres/women.jpg",
                  image: "Women Fashon",
                  description: "T-shirt Tops & Bottoms",
                  ontap: () {}),
            ],
          ),
        ),
 * 
 */

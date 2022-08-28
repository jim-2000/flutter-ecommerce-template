import 'package:app/utils/appColors.dart';
import 'package:app/widgets/catagory/catagoryCard.dart';
import 'package:flutter/material.dart';

class CatagoryScreen extends StatelessWidget {
  const CatagoryScreen({Key? key}) : super(key: key);
  static const String routeName = '/catagoriesScreen';

  @override
  Widget build(BuildContext context) {
    //
    List<Color> gridColor = [
      Colors.red.withOpacity(0.2),
      AppColors.AppGrey,
      Colors.green.withOpacity(0.3),
      Colors.green.withOpacity(0.3),
      AppColors.AppPrimary,
      AppColors.AppGrey,
      const Color(0xffF7A593),
      const Color(0xffD3B0E0),
      AppColors.AppGrey,
      const Color(0xffFDE598),
      const Color(0xffB7DFF5),
      const Color(0xffF7A593),
      const Color(0xffD3B0E0),
    ];
    //
    List<Map<String, dynamic>> catInfo = [
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
    ];
    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.AppPrimary,
        title: const Text(
          "Catagory Screen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_checkout_outlined,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.black,
              )),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: catInfo.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 260 / 250,
            ),
            itemBuilder: (ctx, i) {
              return CategoriesWidgets(
                title: catInfo[i]['catText'],
                imgPath: catInfo[i]['imgPath'],
                pathClr: gridColor[i],
              );
            }),
      ),
    );
  }
}

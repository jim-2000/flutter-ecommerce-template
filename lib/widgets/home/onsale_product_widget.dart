import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/widgets/catagory/priceWidget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class OnsaleProduct extends StatelessWidget {
  const OnsaleProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final theme = Utils(context).getTheme;
    return Card(
      color: AppColors.AppPrimary,
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FancyShimmerImage(
                  imageUrl:
                      "https://res.cloudinary.com/glovoapp/image/fetch//f_auto,q_auto/https://glovoapp.com/images/landing/address-container-image-burger.png",
                  width: size.width * 0.14,
                  height: size.width * 0.15,
                  boxFit: BoxFit.fill,
                ),
                Column(
                  children: [
                    //
                    const Text(
                      "1KG",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.shopping_bag_outlined)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.favorite)),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const PriceWidget(),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Product Title",
              style: TextStyle(
                color: AppColors.AppBlack,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}

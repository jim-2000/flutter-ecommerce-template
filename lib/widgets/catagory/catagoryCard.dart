import 'dart:developer' show log;
import 'package:app/utils/appColors.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import 'package:flutter/material.dart';

class CategoriesWidgets extends StatelessWidget {
  const CategoriesWidgets({
    Key? key,
    required this.imgPath,
    required this.title,
    required this.pathClr,
  }) : super(key: key);

  final String title, imgPath;
  final Color? pathClr;

  @override
  Widget build(BuildContext context) {
    final double hi = MediaQuery.of(context).size.height;
    final double we = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        log(title);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.AppGrey,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FancyShimmerImage(
                height: hi * 0.3,
                width: we * 0.3,
                imageUrl: imgPath,
                errorWidget: Text(title),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${title} ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.AppGrey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.shop)),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:app/models/app/catagoriModel.dart';
import 'package:app/models/productModel.dart';
import 'package:app/screens/catagories/catagoriesProduct.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class CatagorytwoWidget extends StatelessWidget {
  const CatagorytwoWidget({
    Key? key,
    required this.cata,
    this.isRight = false,
  }) : super(key: key);

  final Catagori cata;
  final bool isRight;

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;

    return InkWell(
      onTap: () {
        log(cata.id);
      },
      child: Card(
        elevation: 4,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(right: 10),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white10,
              border: const Border.symmetric()),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FancyShimmerImage(
                imageUrl: cata.catagoriImage.url,
                width: size.width / 2,
                height: size.height * 0.22,
                boxFit: BoxFit.fill,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    cata.name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${cata.slug} ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.lineThrough,
                      color: AppColors.AppGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      /*
       child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: AppColors.AppBlack,
          ),
          image: DecorationImage(
            image: NetworkImage(cata.catagoriImage.url),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              isRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              cata.name.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "${cata.slug} ",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    
    */
    );
  }
}

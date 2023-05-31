import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class CatagoryThumb extends StatelessWidget {
  const CatagoryThumb(
      {Key? key, required this.img, required this.name, this.onTap})
      : super(key: key);
  final String name, img;

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final double hi = MediaQuery.of(context).size.height;
    final double we = MediaQuery.of(context).size.width;
    final Color pathClr =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    final theme = Utils(context).getTheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 1.0,
              blurStyle: BlurStyle.outer,
              spreadRadius: 1.7,
              color: AppColors.AppTextSecondary,
            )
          ],
          border: Border.all(
            color: theme ? AppColors.AppIcon : AppColors.AppIconHover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: FancyShimmerImage(
                imageUrl: img,
                // height: hi * 0.6,
                width: 80,
                boxFit: BoxFit.cover,
                boxDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Text(
              name,
            ),
          ],
        ),
      ),
    );
  }
}

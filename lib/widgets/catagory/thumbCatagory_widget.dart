import 'package:flutter/material.dart';
import 'dart:math' as math;

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
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: hi * 0.3,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(img),
                    fit: BoxFit.fill,
                  ),
                  color: pathClr.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                  // border: Border.all(
                  //   color: AppColors.AppBlack,
                  //   width: 2,
                  // ),
                ),
              ),
            ),
            Text(name),
          ],
        ),
      ),
    );
  }
}

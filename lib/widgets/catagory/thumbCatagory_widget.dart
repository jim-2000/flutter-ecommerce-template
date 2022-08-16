import 'dart:developer';

import 'package:app/utils/appColors.dart';
import 'package:flutter/material.dart';

class CatagoryThumb extends StatelessWidget {
  const CatagoryThumb(
      {Key? key, required this.img, required this.name, required this.pathClr})
      : super(key: key);
  final String name, img;
  final Color pathClr;
  @override
  Widget build(BuildContext context) {
    final double hi = MediaQuery.of(context).size.height;
    final double we = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        log(name + "Thumb product tapped");
      },
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
                    image: AssetImage(img),
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

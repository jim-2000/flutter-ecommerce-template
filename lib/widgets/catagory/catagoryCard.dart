import 'dart:developer' show log;

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
        decoration: BoxDecoration(
            color: pathClr ?? pathClr!.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.lightGreenAccent,
              width: 2,
            )),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: hi * 0.3,
                width: we * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imgPath),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
              maxLines: 1,
            ),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.shop)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

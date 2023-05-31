import 'package:app/app.dart';
import 'package:app/models/app/productModel.dart';
import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class Bestshopwidgets extends StatelessWidget {
  Bestshopwidgets({
    Key? key,
    required this.products,
  }) : super(key: key);
  final Product products;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeProvider>(context);

    return ListTile(
      tileColor: AppColors.AppGrey,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      visualDensity: VisualDensity.comfortable,
      leading: FancyShimmerImage(
        imageUrl: products.thumbnail.url,
        width: 100,
        boxFit: BoxFit.cover,
      ),
      title: Text(products.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            products.brand,
            style: TextStyle(
              fontSize: 10,
              color: themeState.isDark ? Colors.grey.shade200 : Colors.black,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 10,
                color: Colors.yellow.shade500,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.yellow.shade500,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.yellow.shade500,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.yellow.shade500,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.yellow.shade500,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "(1)",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color:
                      themeState.isDark ? Colors.grey.shade200 : Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
      trailing: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: themeState.isDark ? Colors.white54 : Colors.black,
        ),
        child: Center(
          child: const Icon(
            Icons.arrow_forward_ios,
            // size: 12,
            color: Colors.deepOrange,
          ),
        ),
      ),
      isThreeLine: true,
    );
  }
}

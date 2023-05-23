import 'package:app/models/productModel.dart';
import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      tileColor: Theme.of(context).cardColor,
      // contentPadding: EdgeInsets.zero,
      leading: Image.network(
        products.imageUrl[0],
        fit: BoxFit.cover,
        width: 100,
      ),
      title: Text(products.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            products.productBrandName,
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
                color: AppColors.AppPrimary,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: AppColors.AppPrimary,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: AppColors.AppPrimary,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: AppColors.AppPrimary,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: AppColors.AppPrimary,
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
        child: const Icon(
          Icons.arrow_forward_ios,
          // size: 12,
          color: Colors.deepOrange,
        ),
      ),
      isThreeLine: true,
    );
  }
}

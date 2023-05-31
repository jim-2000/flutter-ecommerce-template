import 'package:app/models/app/productModel.dart';
import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class PopularShopWidget extends StatelessWidget {
  const PopularShopWidget({Key? key, required this.products}) : super(key: key);
  final Product products;

  @override
  Widget build(BuildContext context) {
    final double hi = MediaQuery.of(context).size.height;
    final double we = MediaQuery.of(context).size.width;
    final themeState = Provider.of<ThemeProvider>(context);

    return Material(
      borderRadius: BorderRadius.circular(12),
      color: themeState.isDark ? AppColors.AppIconHover : Colors.white,
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            Row(
              children: [
                Hero(
                  tag: products.id,
                  child: FancyShimmerImage(
                    imageUrl: products.thumbnail.url,
                    height: 80,
                    width: 85,
                    boxFit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${products.name.length > 12 ? products.name.substring(0, 10) + '...' : products.name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      products.brand,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // SizedBox(
                    //   height: 18,
                    //   width: 60,
                    //   child: ListView.builder(
                    //     itemCount: 3,
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (ctx, i) {
                    //       return Icon(
                    //         Icons.star,
                    //         color: Colors.yellow,
                    //         size: 10,
                    //       );
                    //     },
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 18,
                          width: 60,
                          child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, i) {
                              return const Icon(
                                Icons.star,
                                color: Colors.deepOrange,
                                size: 10,
                              );
                            },
                          ),
                        ),
                        // we can genaret hare icon list

                        const Text(
                          "(1)",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.deepOrange,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

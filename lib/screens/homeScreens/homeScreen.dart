import 'dart:developer';

import 'package:app/models/app/catagoriModel.dart';
import 'package:app/models/app/productModel.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:app/provider/catagoriProvider.dart';
import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/provider/productProvider.dart';
import 'package:app/screens/catagories/CatagoriProducts.dart';
import 'package:app/screens/catagories/CatagorieListsUI.dart';
import 'package:app/screens/catagories/catagory_Screen.dart';
import 'package:app/services/app/catagoriService.dart';
import 'package:app/services/app/productService.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/navigation_utils.dart';
import 'package:app/widgets/catagory/thumbCatagory_widget.dart';
import 'package:app/widgets/home/bestshop.dart';
import 'package:app/widgets/home/feedWidget.dart';
import 'package:app/widgets/home/latestProduct.dart';
import 'package:app/widgets/home/on_sale_widgets.dart';
import 'package:app/widgets/home/popularshopWidget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offerImg = [
    "assets/images/landing/buy-on-laptop.jpg",
    "assets/images/landing/buy-through.png",
    "assets/images/landing/buyfood.jpg",
    "assets/images/landing/grocery-cart.jpg",
    "assets/images/landing/store.jpg",
    "assets/images/landing/vergtablebg.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final double hi = MediaQuery.of(context).size.height;
    final double we = MediaQuery.of(context).size.width;
    final theme = Provider.of<ThemeProvider>(context);
    final List<Product> products =
        Provider.of<ProductProvider>(context).product();
    final List<Catagori> catagories =
        Provider.of<CatagoriProvider>(context).allCatagories;
    return Consumer2<ProductProvider, CatagoriProvider>(
        builder: (context, prod, cat, _) {
      return prod.isLoading || cat.isLoading
          ? Scaffold(
              body: Center(
                child: SizedBox(
                  height: 25,
                  child: LoadingIndicator(
                      indicatorType: Indicator.ballSpinFadeLoader,
                      strokeWidth: 4,
                      colors: [AppColors.AppPrimary]),
                ),
              ),
            )
          : Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: hi * 0.3,
                      child: Swiper(
                        itemCount: _offerImg.length,
                        autoplay: true,
                        // control: const SwiperControl(),
                        pagination: const SwiperPagination(
                            builder: DotSwiperPaginationBuilder(
                          activeColor: Colors.white,
                          color: Colors.blueGrey,
                        )),
                        itemBuilder: (context, i) {
                          return Image.asset(
                            _offerImg[i],
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                    // space
                    const SizedBox(
                      height: 30,
                    ),
                    //
                    Row(
                      children: [
                        RotatedBox(
                          quarterTurns: -1,
                          child: Row(
                            children: [
                              Text(
                                "ON Sale",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.AppPrimary,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.discount,
                                color: AppColors.AppPrimary,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: SizedBox(
                              height: hi * 0.27,
                              child: ListView.builder(
                                itemCount: products.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, i) {
                                  return LatestProduct(products: products[i]);
                                },
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: _listtitle(
                          title: "Catagory",
                          function: () {
                            pushNamedOnlyTo(
                              routeName: CatagorieListsUI.routeName,
                            );
                          },
                        ),
                      ),
                    ),
                    // catagory list
                    Row(
                      children: [
                        Flexible(
                          child: SizedBox(
                            height: 80,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) {
                                return CatagoryThumb(
                                  img: catagories[i].catagoriImage.url,
                                  name: catagories[i].name,
                                  onTap: () {
                                    log(catagories[i].id);
                                    pushNamedOnlyTo(
                                        routeName: CatagoriProducts.routeName,
                                        arg:
                                            '${catagories[i].id} && ${catagories[i].name}');
                                  },
                                );
                              },
                              itemCount: catagories.length,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            pushNamedOnlyTo(
                              routeName: CatagorieListsUI.routeName,
                            );
                          },
                          child: MirrorAnimationBuilder<double>(
                            tween: Tween(
                                begin: -10.0,
                                end: 10.0), // value for offset x-coordinate
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOutSine, // non-linear animation
                            builder: (context, value, child) {
                              return Transform.translate(
                                offset: Offset(
                                  value,
                                  0,
                                ), // use animated value for x-coordinate
                                child: child,
                              );
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              padding: const EdgeInsets.all(8.0),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_circle_right_outlined,
                                  size: 26,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //
                    const SizedBox(
                      height: 20,
                    ),
                    //
                    const SizedBox(
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: _listtitle(title: "Popular Packages", view: ''),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: ListView.builder(
                        // separatorBuilder: (ctx, i) {
                        //   return Container(
                        //     width: 5,
                        //   );
                        // },

                        itemBuilder: (ctx, i) {
                          return Row(
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                margin: const EdgeInsets.all(2),
                                child: PopularShopWidget(
                                  products: products[i],
                                ),
                              ),
                            ],
                          );
                        },
                        itemCount: products.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    //
                    const SizedBox(
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child:
                            _listtitle(title: "Our Favorite Product", view: ''),
                      ),
                    ),
                    // List view
                    SizedBox(
                      height: hi * 0.24,
                      width: we,
                      child: ListView.builder(
                        itemBuilder: (ctx, i) {
                          return FeeedWidget(
                            products: products[i],
                          );
                        },
                        itemCount: products.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //
                    const SizedBox(
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: _listtitle(title: "Best shop", view: ''),
                      ),
                    ),
                    SizedBox(
                      height: hi / 2,
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, i) {
                          return Card(
                            elevation: 1,
                            child: Bestshopwidgets(products: products[i]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
    });
  }
}

///
class _listtitle extends StatelessWidget {
  const _listtitle({Key? key, required this.title, this.view, this.function})
      : super(key: key);
  final String title;
  final String? view;
  final VoidCallback? function;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        GestureDetector(
          onTap: function ?? () {},
          child: Text(
            view ?? 'View all',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ),
      ],
    );
  }
}

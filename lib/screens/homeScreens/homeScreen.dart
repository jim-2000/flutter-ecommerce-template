import 'package:app/models/productModel.dart';
import 'package:app/models/products.dart';
import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/provider/productProvider.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/widgets/catagory/thumbCatagory_widget.dart';
import 'package:app/widgets/home/bestshop.dart';
import 'package:app/widgets/home/feedWidget.dart';
import 'package:app/widgets/home/latestProduct.dart';
import 'package:app/widgets/home/on_sale_widgets.dart';
import 'package:app/widgets/home/popularshopWidget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//

  final List<String> _offerImg = [
    "assets/images/landing/buy-on-laptop.jpg",
    "assets/images/landing/buy-through.png",
    "assets/images/landing/buyfood.jpg",
    "assets/images/landing/grocery-cart.jpg",
    "assets/images/landing/store.jpg",
    "assets/images/landing/vergtablebg.jpg",
  ];
//

  List<Color> gridColor = [
    Colors.red.withOpacity(0.2),
    Colors.green.withOpacity(0.3),
    AppColors.AppPrimary,
    AppColors.AppGrey,
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
    AppColors.AppGrey,
    const Color(0xffF7A593),
  ];
  //
  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/cat/fruits.png',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/cat/veg.png',
      'catText': 'Vegetables',
    },
    {
      'imgPath': 'assets/images/cat/Spinach.png',
      'catText': 'Herbs',
    },
    {
      'imgPath': 'assets/images/cat/nuts.png',
      'catText': 'Nuts',
    },
    {
      'imgPath': 'assets/images/cat/spices.png',
      'catText': 'Spices',
    },
    {
      'imgPath': 'assets/images/cat/grains.png',
      'catText': 'Grains',
    },
    {
      'imgPath': 'assets/images/cat/fruits.png',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/cat/veg.png',
      'catText': 'Vegetables',
    },
    {
      'imgPath': 'assets/images/cat/Spinach.png',
      'catText': 'Herbs',
    },
  ];
  //

  @override
  Widget build(BuildContext context) {
    final double hi = MediaQuery.of(context).size.height;
    final double we = MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkTheemProvider>(context);
    final List<Product> products =
        Provider.of<ProductProvider>(context).product();
    return Scaffold(
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
            const SizedBox(
              height: 40,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: _listtitle(title: "Catagory"),
              ),
            ),
            // catagory list
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return CatagoryThumb(
                    img: products[i].imageUrl[0],
                    name: '',
                  );
                },
                itemCount: products.length,
              ),
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
                child: _listtitle(title: "Popular Brands"),
              ),
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  return Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
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
                child: _listtitle(title: "Our Favorite Product"),
              ),
            ),
            // List view
            SizedBox(
              height: hi * 0.24,
              width: we,
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  return Card(
                    elevation: 20,
                    child: FeeedWidget(
                      products: products[i],
                    ),
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
                child: _listtitle(title: "Best shop"),
              ),
            ),
            SizedBox(
              height: hi / 2,
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, i) {
                  return Card(
                    elevation: 2,
                    child: Bestshopwidgets(
                      products: products[i],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
class _listtitle extends StatelessWidget {
  const _listtitle({
    Key? key,
    required this.title,
    this.view,
  }) : super(key: key);
  final String title;
  final String? view;
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
        Text(
          view ?? 'View all',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}

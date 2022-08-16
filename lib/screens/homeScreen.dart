import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/widgets/catagory/thumbCatagory_widget.dart';
import 'package:app/widgets/home/feedWidget.dart';
import 'package:app/widgets/home/on_sale_widgets.dart';
import 'package:app/widgets/home/popularshopWidget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//

  List<String> _offerImg = [
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

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Home page"),
      // ),
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
                      height: hi * 0.22,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return OnSaleWidget();
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
                      img: catInfo[i]['imgPath'],
                      name: catInfo[i]['catText'],
                      pathClr: gridColor[i]);
                },
                itemCount: catInfo.length,
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
                child: _listtitle(title: "Popular Packages"),
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
                        margin: const EdgeInsets.all(5),
                        child: const PopularShopWidget(),
                      ),
                    ],
                  );
                },
                itemCount: 10,
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
                  return const Card(
                    elevation: 20,
                    child: FeeedWidget(),
                  );
                },
                itemCount: 10,
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
                itemCount: 10,
                itemBuilder: (context, i) {
                  return Card(
                    elevation: 20,
                    child: ListTile(
                      tileColor: Theme.of(context).cardColor,
                      // contentPadding: EdgeInsets.zero,
                      leading: Image.asset('assets/images/cat/veg.png'),
                      title: const Text("Vagitable Item with dishes"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Wow shop 124 dhaka ",
                            style: TextStyle(
                              fontSize: 10,
                              color: themeState.getDark
                                  ? Colors.grey.shade200
                                  : Colors.black,
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
                                  color: themeState.getDark
                                      ? Colors.grey.shade200
                                      : Colors.black,
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
                          color:
                              themeState.getDark ? Colors.white : Colors.black,
                        ),
                        child: const Icon(
                          Icons.shopping_basket,
                          // size: 12,
                          color: Colors.deepOrange,
                        ),
                      ),
                      isThreeLine: true,
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

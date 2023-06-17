import 'package:app/provider/auth/UserProvider.dart';
import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/screens/auth/resetPassword.dart';
import 'package:app/screens/order/OrderScreen.dart';
import 'package:app/screens/wishlist/wishlist.dart';
import 'package:app/services/auth/AuthService.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/modalBottom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  static const String routeName = '/userScreen';

  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _editingController =
      TextEditingController(text: '');

  double top = 0;
  late ScrollController _scrollController;
  final String imgs =
      "https://avatars.githubusercontent.com/u/64397792?s=400&u=b893043c1c3b0a6ef368d9c9e4ee71dda86159c6&v=4";
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _editingController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeProvider>(context);
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
        primary: false,
        body: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                SliverAppBar(
                  backgroundColor: AppColors.AppGrey,
                  pinned: true,
                  stretch: true,
                  expandedHeight: 250,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 12,
                            ),
                            SizedBox(
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(user.user.img),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Hi, ",
                                style: const TextStyle(
                                  color: Colors.cyan,
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: user.user.username,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: AppColors.Dark,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          user.user.email,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.teal,
                          ),
                        )
                      ],
                    ),
                    background: Image.asset(
                      'assets/images/landing/bg.jpg',
                      fit: BoxFit.cover,
                      scale: 1.6,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        userTileNaME(text: "Settings"),
                        const SizedBox(
                          height: 20,
                        ),
                        SwitchListTile(
                          activeColor: AppColors.AppPrimary,
                          tileColor: AppColors.AppIcon,
                          title: const Text(
                            "Theme",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          secondary: Icon(
                            themeState.isDark
                                ? Icons.nightlight_outlined
                                : Icons.sunny,
                            color: AppColors.AppIconHover,
                          ),
                          value: themeState.isDark,
                          onChanged: (bool value) {
                            themeState.setDarkMode = value;
                          },
                        ),
                        _listTiles(
                          title: "Order",
                          subtitle: "check you order details",
                          leadingIcon: Icons.shopping_bag,
                          ontap: () async {
                            Navigator.pushNamed(context, OrderScreen.routeName);
                          },
                        ),
                        _listTiles(
                          title: "WishList",
                          leadingIcon: Icons.favorite,
                          subtitle: "Your favorite items are there",
                          ontap: () {
                            Navigator.of(context)
                                .pushNamed(WishlistScreen.routeName);
                          },
                        ),
                        _listTiles(
                          title: "Delivery Address",
                          leadingIcon: Icons.location_on,
                          ontap: () async {},
                        ),
                        _listTiles(
                          title: "Reset Password",
                          leadingIcon: Icons.lock_reset,
                          ontap: () {
                            Navigator.pushNamed(
                                context, ResetPassword.routeName);
                          },
                        ),
                        _listTiles(
                          title: "Logout",
                          leadingIcon: Icons.logout_outlined,
                          ontap: () async {
                            await AppModalBottomSheet.showDialoge(
                              title: "Confirm Logout",
                              description: "Are you sure to logout?",
                              buttonTitle: "Logout",
                              onpress: () {
                                AuthServices().signOut(context);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  Widget _modal(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
            child: Text(
              "Delivery Address",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _addressData(
                    title: "Street",
                    subtitle: "123/A , ABC, XYZ",
                  ),
                  _addressData(
                    title: "City",
                    subtitle: "xyz",
                  ),
                  _addressData(
                    title: "State",
                    subtitle: "xyz",
                  ),
                  _addressData(
                    title: "Phone",
                    subtitle: "+880 17XXXXXXXX",
                  ),
                  _addressData(
                    title: "zip",
                    subtitle: "2260",
                  ),
                  _addressData(
                    title: "Name",
                    subtitle: "Hoossain",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text _addressData({required String title, required String subtitle}) {
    return Text.rich(
      TextSpan(
        text: "$title: ",
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: subtitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listTiles(
      {required String title,
      String? subtitle,
      required IconData leadingIcon,
      required Function ontap}) {
    return Card(
      color: AppColors.AppIcon,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: subtitle == null ? null : Text(subtitle),
        leading: Icon(
          leadingIcon,
          color: AppColors.AppIconHover,
        ),
        trailing: Icon(
          Icons.arrow_right,
          color: AppColors.AppPrimary,
        ),
        onTap: () {
          ontap();
        },
      ),
    );
  }

  //
  Future<void> _showDialoge({
    required String title,
    required Widget widget,
    List<Widget>? iconButton,
  }) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: widget,
            actions: iconButton,
          );
        });
  }
  //

  Widget userTileNaME({required String text}) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.underline,
        letterSpacing: 1.3,
      ),
      softWrap: true,
    );
  }
}

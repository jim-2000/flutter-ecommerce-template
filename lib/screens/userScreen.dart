import 'dart:developer';

import 'package:app/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../utils/appColors.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _editingController =
      TextEditingController(text: '');
  bool isLoading = false;
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
    final themeState = Provider.of<DarkTheemProvider>(context);
    return Scaffold(
        primary: false,
        body: isLoading
            ? Container(
                color: Colors.blueGrey,
                child: const Center(child: CircularProgressIndicator()),
              )
            : Stack(
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
                                      backgroundImage: NetworkImage(imgs),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      text: "Hi, ",
                                      style: TextStyle(
                                        color: Colors.cyan,
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "UserName",
                                          style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                "hossainaljim24@gmail.com",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.teal,
                                ),
                              )
                            ],
                          ),
                          background: Image.network(
                            imgs,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              userTileNaME(text: "Settings"),
                              SwitchListTile(
                                title: const Text(
                                  "Theme",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                secondary: Icon(themeState.getDark
                                    ? Icons.nightlight_outlined
                                    : Icons.sunny),
                                value: themeState.getDark,
                                onChanged: (bool value) {
                                  themeState.setDarkTheme = value;
                                },
                              ),
                              _listTiles(
                                title: "Address",
                                subtitle: "Wow subtitle",
                                leadingIcon: Icons.location_on,
                                ontap: () async {
                                  await _showDialoge(
                                      title: "Update Address",
                                      widget: TextField(
                                        controller: _editingController,
                                        onChanged: (s) {
                                          setState(() {
                                            _editingController.text = s;
                                          });
                                        },
                                        maxLines: 4,
                                        decoration: const InputDecoration(
                                          hintText: "Dhaka,124",
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      iconButton: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                            size: 24,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(
                                            Icons.done,
                                            color: Colors.green,
                                            size: 24,
                                          ),
                                        ),
                                      ]);
                                },
                              ),
                              _listTiles(
                                title: "Order",
                                subtitle: "check you order details",
                                leadingIcon: Icons.shopping_bag,
                                ontap: () async {},
                              ),
                              _listTiles(
                                title: "WishList",
                                leadingIcon: Icons.favorite,
                                subtitle: "Your favorite items are there",
                                ontap: () {},
                              ),
                              _listTiles(
                                title: "Viewed",
                                leadingIcon: Icons.remove_red_eye,
                                ontap: () async {
                                  log("views");
                                  await showMaterialModalBottomSheet(
                                    context: context,
                                    builder: (context) => SingleChildScrollView(
                                      controller:
                                          ModalScrollController.of(context),
                                      child: Container(
                                        height: 500,
                                        child: Text("Viewd Adress"),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              _listTiles(
                                title: "Forget Password",
                                leadingIcon: Icons.lock_reset,
                                ontap: () {},
                              ),
                              _listTiles(
                                title: "Logout",
                                leadingIcon: Icons.logout_outlined,
                                ontap: () async {
                                  await _showDialoge(
                                    title: "Logout",
                                    widget: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          const Text("Do you want to Logout"),
                                    ),
                                    iconButton: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Log out",
                                          style: TextStyle(
                                            color: Colors.tealAccent,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Cencel",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
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

  Widget _listTiles(
      {required String title,
      String? subtitle,
      required IconData leadingIcon,
      required Function ontap}) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: subtitle == null ? null : Text(subtitle),
        leading: Icon(leadingIcon),
        trailing: const Icon(Icons.arrow_right),
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

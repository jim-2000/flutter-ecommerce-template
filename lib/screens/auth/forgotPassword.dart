// ignore_for_file: sort_child_properties_last

import 'dart:developer';

import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/utils/inputWidgets.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  static const String routeName = 'auth/forgotPassword';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final sizes = Utils(context).getScreenSize;
    final inputs = AppinputWidgets(context);

//

    return Scaffold(
      backgroundColor: theme ? AppColors.AppBlack : AppColors.AppBg,
      extendBody: true,
      appBar: AppBar(
        // toolbarHeight: 400,
        bottom: const PreferredSize(
            child: SizedBox(),
            preferredSize: Size(
              double.infinity,
              190,
            )),
        backgroundColor: theme ? AppColors.AppBlack : AppColors.AppBg,
        elevation: 0,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: theme ? AppColors.AppBlack : AppColors.AppBg,
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/images/cat/veg.png",
                width: 40,
                height: 40,
              ),
              Text(
                "ultiKart",
                style: TextStyle(
                  color: theme ? AppColors.AppBg : AppColors.AppBlack,
                ),
              )
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () {}, child: const Text("SKIP")),
          const SizedBox(
            width: 40,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot \nPassword ?",
                style: TextStyle(
                  fontSize: 34,
                  color: theme ? AppColors.AppBg : AppColors.AppBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              inputs.signupInput(
                  // context: context,
                  text: "Email",
                  controller: textEditingController,
                  onChanged: (text) {
                    setState(() {
                      textEditingController.text;
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              inputs.btn(
                text: "SEND OTP",
                callback: () {
                  log(textEditingController.text);
                  textEditingController.text = '';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

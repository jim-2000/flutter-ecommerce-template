// ignore_for_file: sort_child_properties_last

import 'dart:developer';

import 'package:app/provider/auth/UserProvider.dart';
import 'package:app/services/auth/AuthService.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/utils/inputWidgets.dart';
import 'package:app/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:loading_indicator/loading_indicator.dart';

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

    return Consumer<UserProvider>(
      builder: (ctx, val, _) {
        return val.isLoading
            ? Scaffold(
                body: Center(
                  child: SizedBox(
                    height: 65,
                    child: LoadingIndicator(
                        indicatorType: Indicator.ballSpinFadeLoader,
                        strokeWidth: 4,
                        colors: [AppColors.AppPrimary]),
                  ),
                ),
              )
            : GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Scaffold(
                  backgroundColor: theme ? AppColors.AppBlack : AppColors.AppBg,
                  extendBody: true,
                  appBar: AppBar(
                    // toolbarHeight: 400,
                    bottom: const PreferredSize(
                      child: SizedBox(),
                      preferredSize: Size(
                        double.infinity,
                        190,
                      ),
                    ),
                    backgroundColor:
                        theme ? AppColors.AppBlack : AppColors.AppBg,
                    elevation: 0,
                    title: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: theme ? AppColors.AppBlack : AppColors.AppBg,
                      ),
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
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
                              color:
                                  theme ? AppColors.AppBg : AppColors.AppBlack,
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
                              if (textEditingController.text.isEmpty) {
                                showSimpleNotification(
                                    msg: 'email can not be empty',
                                    color: AppColors.AppPrimary);
                              } else if (textEditingController.text.isEmail) {
                                AuthServices().forgetPassword(
                                    context, textEditingController.text);
                              } else {
                                showSimpleNotification(
                                    msg: 'Provide a valid email address',
                                    color: AppColors.AppPrimary);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}

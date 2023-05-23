import 'dart:developer';

import 'package:app/provider/auth/UserProvider.dart';
import 'package:app/services/auth/AuthService.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/utils/inputWidgets.dart';
import 'package:app/utils/toast_utils.dart';
import 'package:app/widgets/auth/OtpWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);
  static const String routeName = 'auth/resetScreen';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isvisiable = false;
  void _toggleVisibility() {
    setState(() {
      isvisiable = !isvisiable;
      log(isvisiable.toString());
    });
  }

  final TextEditingController _newPasswordcontroller = TextEditingController();
  final TextEditingController _confirmPasswordcontroller =
      TextEditingController();
  final TextEditingController _otp = TextEditingController();

  //
  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments.toString();
    final theme = Utils(context).getTheme;
    final sizes = Utils(context).getScreenSize;
    final inputs = AppinputWidgets(context);
    // reset

    //
    return Consumer<UserProvider>(builder: (context, val, _) {
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
          : Scaffold(
              backgroundColor: theme ? AppColors.AppBlack : AppColors.AppBg,
              appBar: AppBar(
                bottom: const PreferredSize(
                    preferredSize: Size(
                      double.infinity,
                      50,
                    ),
                    child: SizedBox()),
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
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reset \nPassword !",
                        style: TextStyle(
                          fontSize: 34,
                          color: theme ? AppColors.AppBg : AppColors.AppBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      OtpPinput(oncomplete: (v) {
                        setState(() {
                          _otp.text = v;
                        });
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      inputs.passwordInput(
                        text: "New Password",
                        isobsecure: isvisiable,
                        controller: _newPasswordcontroller,
                        onChanged: (p0) {
                          setState(() {
                            _newPasswordcontroller.text;
                          });
                        },
                        suffix: IconButton(
                          onPressed: _toggleVisibility,
                          icon: Icon(
                              isvisiable
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off,
                              color: AppColors.AppGrey),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      inputs.passwordInput(
                          text: "Confirm Password",
                          controller: _confirmPasswordcontroller,
                          isobsecure: true,
                          onChanged: (p0) {
                            setState(() {
                              _confirmPasswordcontroller.text = p0;
                            });
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      inputs.btn(
                        text: "reset password",
                        callback: () {
                          final form = {
                            "email": email,
                            "password": _newPasswordcontroller.text,
                            "otp": _otp.text,
                            "confirm": _confirmPasswordcontroller.text,
                          };
                          if (_newPasswordcontroller.text.length > 5) {
                            if (_otp.text.length > 5) {
                              if (_newPasswordcontroller.text ==
                                  _confirmPasswordcontroller.text) {
                                AuthServices().resetPassword(
                                  context,
                                  email,
                                  _confirmPasswordcontroller.text,
                                  _otp.text,
                                );
                              } else {
                                showSimpleNotification(
                                    msg: "",
                                    title:
                                        "New password & Confirm password not match");
                              }
                            } else {
                              showSimpleNotification(
                                msg: "",
                                title: "Please fill up Otp",
                              );
                            }
                          } else {
                            showSimpleNotification(
                              msg: "",
                              title: "Minimum password length is 6 characters",
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}

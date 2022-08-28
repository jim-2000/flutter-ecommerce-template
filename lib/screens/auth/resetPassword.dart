import 'dart:developer';

import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/utils/inputWidgets.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final sizes = Utils(context).getScreenSize;
    final inputs = AppinputWidgets(context);
    return Scaffold(
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
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
              inputs.passwordInput(text: "Current Password"),
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
                      isvisiable ? Icons.remove_red_eye : Icons.visibility_off,
                      color: AppColors.AppGrey),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              inputs.passwordInput(text: "Confirm Password"),
              const SizedBox(
                height: 20,
              ),
              inputs.btn(
                text: "reset password",
                callback: () {
                  log(_newPasswordcontroller.text);
                  _newPasswordcontroller.text = '';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

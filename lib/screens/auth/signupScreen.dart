import 'dart:developer';

import 'package:app/screens/auth/loginScreen.dart';
import 'package:app/screens/bottom_bar_Screen.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/utils/inputWidgets.dart';
import 'package:app/utils/modalBottom.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = 'auth/signupScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isvisiable = false;
  void _toggleVisibility() {
    setState(() {
      isvisiable = !isvisiable;
      log(isvisiable.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final sizes = Utils(context).getScreenSize;
    final inputs = AppinputWidgets(context);

    return Scaffold(
      backgroundColor: theme ? AppColors.AppBlack : AppColors.AppBg,
      appBar: AppBar(
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
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                "Hey",
                style: TextStyle(
                  fontSize: 32,
                  color: theme ? AppColors.AppBg : AppColors.AppBlack,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Sign Up",
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
                text: "First Name",
                controller: _firstName,
                onChanged: (p0) {
                  log(p0);
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 20,
              ),
              inputs.signupInput(
                text: "Last Name",
                controller: _lastName,
                onChanged: (p0) {
                  log(p0);
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 20,
              ),
              inputs.signupInput(
                text: "Email",
                controller: _emailController,
                onChanged: (p0) {
                  log(p0);
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 20,
              ),
              inputs.signupInput(
                text: "Password",
                controller: _passwordController,
                onChanged: (p0) {
                  log(p0);
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 55),
                    primary: AppColors.AppPrimary,
                  ),
                  onPressed: () {
                    if (_firstName.text.isEmpty ||
                        _lastName.text.isEmpty ||
                        _emailController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      AppModalBottomSheet.showDialoge(
                        title: "Input Error",
                        description: "Please fill up all the Fileds",
                      );
                    } else {
                      Navigator.pushNamed(context, BottomBarScreen.routeName);
                    }
                  },
                  child: Text(
                    "Sign up".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 4,
                    ),
                  ),
                ),
              ),
              devides(sizes),
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _imageButton(
                        fun: () {
                          log("Facebook login");
                        },
                        img: 'assets/images/icons/facebook.png'),
                    _imageButton(
                        fun: () {
                          log("Google login");
                        },
                        img: 'assets/images/icons/google.png'),
                    _imageButton(
                        fun: () {
                          log("apple login");
                        },
                        img: 'assets/images/icons/apple.jpg'),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Alrady have an account ? ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _imageButton({required Function fun, required String img}) {
    return InkWell(
      onTap: () {
        fun();
      },
      child: Card(
        color: AppColors.AppBg.withOpacity(0.7),
        elevation: 6,
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(5),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white70,
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

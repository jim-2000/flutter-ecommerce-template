import 'dart:developer';

import 'package:app/provider/auth/UserProvider.dart';
import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/screens/auth/loginScreen.dart';
import 'package:app/screens/bottom_bar_Screen.dart';
import 'package:app/services/auth/AuthService.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/utils/inputWidgets.dart';
import 'package:app/utils/modalBottom.dart';
import 'package:app/utils/navigation_utils.dart';
import 'package:app/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = 'auth/signupScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isvisiable = false;
  void _toggleVisibility() {
    setState(() {
      isvisiable = !isvisiable;
      log(isvisiable.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizes = Utils(context).getScreenSize;
    final inputs = AppinputWidgets(context);
    final theme = Provider.of<ThemeProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final authservice = AuthServices();
    //---------
    void register() async {
      if (_phoneController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _usernameController.text.isNotEmpty) {
        authservice.signUpUser(
          context,
          _usernameController.text,
          _emailController.text,
          _passwordController.text,
          _phoneController.text,
        );
      } else {
        showSimpleNotification(
          msg: "Please Fill up all fields",
          color: Colors.red.shade500,
          title: 'Validation error',
        );
      }
    }

    //
    return Consumer<UserProvider>(
      builder: (conte, value, _) {
        return value.isLoading
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
                backgroundColor:
                    theme.isDark ? AppColors.AppBlack : AppColors.AppBg,
                appBar: AppBar(
                  backgroundColor:
                      theme.isDark ? AppColors.AppBlack : AppColors.AppBg,
                  elevation: 0,
                  title: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color:
                          theme.isDark ? AppColors.AppBlack : AppColors.AppBg,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/cat/veg.png",
                          width: 40,
                          height: 40,
                        ),
                        Text(
                          "Easy Shop",
                          style: TextStyle(
                            color: theme.isDark
                                ? AppColors.AppBg
                                : AppColors.AppBlack,
                          ),
                        )
                      ],
                    ),
                  ),
                  actions: [
                    InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.AppGrey,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
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
                            color: theme.isDark
                                ? AppColors.AppBg
                                : AppColors.AppBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 34,
                            color: theme.isDark
                                ? AppColors.AppBg
                                : AppColors.AppBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        inputs.signupInput(
                          text: "User Name",
                          controller: _usernameController,
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
                          text: "Phone Number",
                          controller: _phoneController,
                          onChanged: (p0) {
                            log(p0);
                            setState(() {});
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        inputs.passwordInput(
                          isobsecure: true,
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
                        inputs.passwordInput(
                          isobsecure: true,
                          suffix: Icon(Icons.lock_outline,
                              color: AppColors.AppTextPrimary),
                          text: "Confirm Password",
                          controller: _confirmPasswordController,
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
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 55),
                              backgroundColor: AppColors.AppPrimary,
                            ),
                            onPressed: () {
                              if (_passwordController.text ==
                                  _confirmPasswordController.text) {
                                register();
                              } else {
                                showSimpleNotification(
                                  msg:
                                      "Confrim Password not math with password ",
                                  color: AppColors.AppPrimary,
                                );
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
                                  pushNamedToReplace(
                                      routeName: LoginScreen.routeName);
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
      },
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

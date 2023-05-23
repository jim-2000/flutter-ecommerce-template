import 'dart:developer' show log;
import 'package:app/provider/auth/UserProvider.dart';
import 'package:app/screens/auth/forgotPassword.dart';
import 'package:app/screens/auth/signupScreen.dart';
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = 'auth/loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isvisiable = false;
  void _toggleVisibility() {
    setState(() {
      isvisiable = !isvisiable;
      log(isvisiable.toString());
    });
  }

  @override
  void initState() {
    _emailController.text = '';
    _passwordController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final sizes = Utils(context).getScreenSize;
    final inputs = AppinputWidgets(context);

    final userProvider = Provider.of<UserProvider>(context);
    bool obsecure = false;
    final authservice = AuthServices();
    //
    void login() async {
      if (_emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        authservice.loginUser(
          context,
          _emailController.text,
          _passwordController.text,
        );
      } else {
        userProvider.isLoading = true;
        showSimpleNotification(
          msg: "Please Fill up all fields",
          color: Colors.red.shade500,
          title: 'Validation error',
        );
        userProvider.isLoading = false;
      }
    }

    return Consumer<UserProvider>(builder: (context, value, _) {
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
                        height: 80,
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
                        "Login Now",
                        style: TextStyle(
                          fontSize: 34,
                          color: theme ? AppColors.AppBg : AppColors.AppBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      inputs.signupInput(
                        text: "Email",
                        controller: _emailController,
                        onChanged: (value) {
                          log(value);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      inputs.passwordInput(
                          text: "Password",
                          controller: _passwordController,
                          isobsecure: isvisiable,
                          suffix: IconButton(
                            onPressed: _toggleVisibility,
                            icon: Icon(
                                isvisiable
                                    ? Icons.remove_red_eye
                                    : Icons.visibility_off,
                                color: AppColors.AppGrey),
                          ),
                          onChanged: (p0) {
                            setState(() {});
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                        child: GestureDetector(
                          onTap: () {
                            pushNamedOnlyTo(
                              routeName: ForgotPassword.routeName,
                            );
                          },
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Forgot Passowrd?",
                              style: TextStyle(
                                color: AppColors.AppPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                          onPressed: login,
                          child: Text(
                            "Log in".toUpperCase(),
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
                              "Don't have account ? ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                pushNamedToReplace(
                                    routeName: SignUpScreen.routeName);
                              },
                              child: const Text(
                                "Sign up",
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
    });
  }
}

TextFormField signupInput({
  required String text,
  required BuildContext context,
  InputDecoration? decoration,
  TextEditingController? controller,
  void Function(String)? onChanged,
}) {
  final theme = Utils(context).getTheme;
  return TextFormField(
    controller: controller,
    onChanged: onChanged,
    style: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    decoration: decoration ??
        InputDecoration(
          label: Text(
            text,
            style: TextStyle(
              color: AppColors.AppGrey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: AppColors.AppPrimary,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: theme ? Colors.white : Colors.black,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.all(20.0),
        ),
  );
}

SizedBox devides(Size sizes) {
  return SizedBox(
    height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1,
          width: sizes.width / 4,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
          ),
        ),
        const Text("Or sign up with"),
        Container(
          height: 1,
          width: sizes.width / 4,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
          ),
        ),
      ],
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

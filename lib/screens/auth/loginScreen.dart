import 'dart:developer';

import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final sizes = Utils(context).getScreenSize;
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
              signupInput(context: context, text: "Email/Phone"),
              const SizedBox(
                height: 20,
              ),
              signupInput(
                context: context,
                text: "Password",
                decoration: InputDecoration(
                  label: Text(
                    "Password",
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
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 55),
                    primary: AppColors.AppPrimary,
                  ),
                  onPressed: () {},
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
                  children: const [
                    Text(
                      "Don't have account ? ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
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

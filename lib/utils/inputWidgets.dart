import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:flutter/material.dart';

class AppinputWidgets {
  BuildContext context;
  AppinputWidgets(this.context);
//
  Widget textinput({
    required String text,
    InputDecoration? decoration,
    TextEditingController? controller,
    void Function(String)? onChanged,
    int? minline,
    int? maxline,
    TextInputType? inputType,
  }) {
    final theme = Utils(context).getTheme;
    return TextField(
      minLines: minline,
      maxLines: maxline,
      controller: controller,
      onChanged: onChanged,
      keyboardType: inputType,
      style: TextStyle(
        color: theme ? Colors.white : Colors.black,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        label: Text(
          text,
          style: TextStyle(
            color: AppColors.AppIconHover,
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

  //
  Widget signupInput({
    required String text,
    InputDecoration? decoration,
    TextEditingController? controller,
    void Function(String)? onChanged,
  }) {
    final theme = Utils(context).getTheme;
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: TextStyle(
        color: theme ? Colors.white : Colors.black,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
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

  // password input fields
  Widget passwordInput({
    required String text,
    InputDecoration? decoration,
    TextEditingController? controller,
    void Function(String)? onChanged,
    Widget? suffix,
    Widget? prefix,
    bool? isobsecure,
  }) {
    final theme = Utils(context).getTheme;
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: TextStyle(
        color: theme ? Colors.white : Colors.black,
        fontWeight: FontWeight.w500,
      ),
      obscureText: isobsecure ?? false,
      decoration: InputDecoration(
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
        suffixIcon: suffix,
        prefix: prefix,
      ),
    );
  }
  //

  Widget btn({
    required String text,
    required VoidCallback callback,
    Size? size,
    double? vpading,
    double? hpading,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: vpading ?? 2, horizontal: hpading ?? 2),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: size ?? Size(MediaQuery.of(context).size.width, 55),
          primary: AppColors.AppPrimary,
        ),
        onPressed: callback,
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: 4,
          ),
        ),
      ),
    );
  }
}

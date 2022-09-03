import 'package:app/utils/appColors.dart';
import 'package:flutter/material.dart';

class Style {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? AppColors.AppBlack : AppColors.AppBg,
        titleTextStyle: TextStyle(
          color: isDarkTheme ? AppColors.AppBg : AppColors.AppBlack,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(
          color: isDarkTheme ? AppColors.AppBg : AppColors.AppPrimary,
          size: 24,
          opacity: 1,
        ),
      ),
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor:
          isDarkTheme ? AppColors.AppBlack : AppColors.AppBg,
      primaryColor: AppColors.AppPrimary,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: isDarkTheme ? AppColors.AppBlack : AppColors.AppBg,
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor: isDarkTheme ? AppColors.AppBlack : AppColors.AppBg,
      canvasColor: isDarkTheme ? AppColors.AppBlack : AppColors.AppBg,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light(),
          ),
      iconTheme: IconThemeData(
        color: isDarkTheme ? AppColors.AppPrimary : AppColors.AppGrey,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: isDarkTheme ? AppColors.AppBg : AppColors.AppBlack,
        ),
        headline2: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: isDarkTheme ? AppColors.AppBg : AppColors.AppBlack,
        ),
        headline3: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isDarkTheme ? AppColors.AppBg : AppColors.AppBlack,
        ),
        headline4: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isDarkTheme ? AppColors.AppBg : AppColors.AppBlack,
        ),
        headline5: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: isDarkTheme ? AppColors.AppBg : AppColors.AppBlack,
        ),
        headline6: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isDarkTheme ? AppColors.AppBg : AppColors.AppBlack,
        ),
        subtitle1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isDarkTheme ? AppColors.AppBg : AppColors.AppBlack,
        ),
        subtitle2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: isDarkTheme ? AppColors.AppBg : AppColors.AppBlack,
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isDarkTheme ? AppColors.AppBg : AppColors.AppBlack,
        ),
        bodyText2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: isDarkTheme ? AppColors.AppBg : AppColors.AppBlack,
        ),
      ),
    );
  }
}

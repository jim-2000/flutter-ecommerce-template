import 'package:app/utils/appColors.dart';
import 'package:flutter/material.dart';

class Style {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
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
            colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light(),
          ),
    );
  }
}

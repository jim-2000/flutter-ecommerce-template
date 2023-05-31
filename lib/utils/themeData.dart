import 'package:app/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? AppColors.Dark : AppColors.AppBg,
        titleTextStyle: TextStyle(
          color: isDarkTheme ? AppColors.AppBg : AppColors.Dark,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(
          color: isDarkTheme ? AppColors.AppIcon : AppColors.AppIconHover,
          size: 24,
          opacity: 1,
        ),
      ),
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: isDarkTheme ? AppColors.Dark : AppColors.AppBg,
      primaryColor: AppColors.AppPrimary,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: isDarkTheme ? AppColors.Dark : AppColors.AppBg,
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor: isDarkTheme ? AppColors.Dark : AppColors.AppBg,
      canvasColor: isDarkTheme ? AppColors.Dark : AppColors.AppBg,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light(),
          ),
      iconTheme: IconThemeData(
        color: isDarkTheme ? AppColors.AppIcon : AppColors.AppIconHover,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.urbanist(
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color: isDarkTheme ? AppColors.AppBg : AppColors.AppTextPrimary,
        ), //headline1, 35
        displayMedium: GoogleFonts.urbanist(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: isDarkTheme ? AppColors.AppBg : AppColors.AppTextPrimary,
        ), //headline2, 30
      ),
    );
  }
}

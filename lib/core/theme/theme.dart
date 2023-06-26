import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assessment/core/constants/custom_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primarySwatch: CustomColors.primarySwatch,
    brightness: Brightness.light,
    scaffoldBackgroundColor: CustomColors.bgColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: CustomColors.primaryColor,
      onPrimary: Colors.white,
      secondary: CustomColors.secondaryColor,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: CustomColors.bgColor,
      onBackground: CustomColors.primaryColor,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    cardColor: Colors.white,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: CustomColors.primaryColor,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      elevation: 0.3,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  );
}

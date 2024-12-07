import 'package:challenge/core/app_colors.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  hintColor: Colors.teal,
  fontFamily: "Roboto",
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.mainTextColor1),
    bodyLarge: TextStyle(
        fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
    bodyMedium: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black54),
    bodySmall: TextStyle(
        fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black87),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 1,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.teal,
  scaffoldBackgroundColor: Colors.black,
  iconTheme: const IconThemeData(color: AppColors.contentColorWhite),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.mainTextColor1),
    displayLarge: TextStyle(
        fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
    bodySmall: TextStyle(
        fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white70),
  ),
);

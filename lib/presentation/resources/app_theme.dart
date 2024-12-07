import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blueAccent,
  hintColor: Colors.teal,
  fontFamily: "dd",
  textTheme: const TextTheme(
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

import 'package:challenge/orders/presentation/order_graph/view/order_graph_screen.dart';
import 'package:challenge/presentation/home/view/home_screen.dart';
import 'package:challenge/core/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlapKapApp());
}

class FlapKapApp extends StatelessWidget {
  FlapKapApp({super.key});
  final ThemeNotifier themeNotifier = ThemeNotifier();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (context, mode, child) {
          return MaterialApp(
            theme: lightTheme,
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
          );
        });
  }
}

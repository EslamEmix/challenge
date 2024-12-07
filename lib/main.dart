import 'package:challenge/orders/presentation/order_graph/view/order_graph_screen.dart';
import 'package:challenge/presentation/resources/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlapKapApp());
}

class FlapKapApp extends StatelessWidget {
  const FlapKapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: const OrderGraphScreen(),
    );
  }
}

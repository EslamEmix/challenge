import 'package:challenge/orders/presentation/order_metrics/view/order_metrics_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlapKapApp());
}

class FlapKapApp extends StatelessWidget {
  const FlapKapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OrderMetricsScreen(),
    );
  }
}

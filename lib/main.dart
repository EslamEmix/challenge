import 'package:challenge/presentation/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(const FlapKapApp());
}

class FlapKapApp extends StatelessWidget {
  const FlapKapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}

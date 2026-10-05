import 'package:flutter/material.dart';
import 'splash_screen.dart';
void main() {
  runApp(const TeaMartApp());
}

class TeaMartApp extends StatelessWidget {
  const TeaMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TeaMart',
      home: const SplashScreen(),
    );
  }
}

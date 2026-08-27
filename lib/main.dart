import 'package:flutter/material.dart';
import 'main_navigation_page.dart';

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
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFEFE2CB)),
      home: const MainNavigationPage(),
    );
  }
}

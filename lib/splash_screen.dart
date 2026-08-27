import 'dart:async';
import 'package:flutter/material.dart';
import 'visit_1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Visit1Page()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7EEDD),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                'assets/kulhad_tea.png',
                height: 180,
                fit: BoxFit.contain,
              ),
              const Spacer(),
              Image.asset(
                'assets/TeaMart.png',
                height: 120,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

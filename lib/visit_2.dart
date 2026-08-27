import 'package:flutter/material.dart';
import 'visit_3.dart';

class Visit2Page extends StatelessWidget {
  const Visit2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Visit3Page()),
            );
          } else if (details.primaryVelocity! > 0) {
            Navigator.pop(context);
          }
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xFF3B2314),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/tea.png', height: 60, color: Colors.white),
                Image.asset(
                  'assets/tea2.png',
                  height: 240,
                  fit: BoxFit.contain,
                ),
                const Column(
                  children: [
                    Text(
                      'Wake Up to Better\nCoffee',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 4,
                          backgroundColor: Colors.white38,
                        ),
                        SizedBox(width: 8),
                        CircleAvatar(radius: 4, backgroundColor: Colors.white),
                      ],
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Savor expertly crafted coffee\nblends for every moment.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'visit_2.dart';

class Visit1Page extends StatelessWidget {
  const Visit1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onPanEnd: (details) {
          // ડાબી તરફ સ્વાઇપ કરવાથી આગળના પેજ પર જશે
          if (details.velocity.pixelsPerSecond.dx < -100) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Visit2Page()),
            );
          }
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xFF143B23),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Logo and Title Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/tea.png', height: 40),
                    const SizedBox(width: 10),
                    const Text(
                      'TeaMart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),

                // Middle Image Section
                Image.asset(
                  'assets/tea1.png',
                  height: 240,
                  fit: BoxFit.contain,
                ),

                // Bottom Text & Indicator Section
                Column(
                  children: [
                    const Text(
                      'Experience\nFreshness',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildIndicator(isActive: true),
                        const SizedBox(width: 8),
                        _buildIndicator(isActive: false),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Discover hand-picked premium\nteas from around the globe.',
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

  Widget _buildIndicator({required bool isActive}) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.white : Colors.white38,
      ),
    );
  }
}
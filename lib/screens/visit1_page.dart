import 'package:flutter/material.dart';

class Visit1Page extends StatelessWidget {
  const Visit1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF143B23),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
      child: Column(
        children: [
          // Top Logo and Title Section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/tea.png', height: 40),
              const SizedBox(width: 10), // Logo અને Text વચ્ચે જગ્યા માટે
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

          const Spacer(),

          Image.asset('assets/tea1.png', height: 220),

          const SizedBox(height: 30),

          const Text(
            'Experience\nFreshness',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIndicator(isActive: true),
              const SizedBox(width: 8),
              _buildIndicator(isActive: false),
            ],
          ),

          const SizedBox(height: 30),

          const Text(
            'Discover hand-picked premium\nteas from around the globe.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),

          const Spacer(),
        ],
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

import 'package:flutter/material.dart';

class TeaMartLogo extends StatelessWidget {
  const TeaMartLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(Icons.eco, color: Color(0xFF0C3D2E), size: 45),
        Text(
          'TeaMart',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0C3D2E),
          ),
        ),
        Text(
          'Good Tea, Delivered to Your Door',
          style: TextStyle(fontSize: 10, color: Color(0xFF5A3A22)),
        ),
      ],
    );
  }
}

Widget buildTextField(String hint, IconData icon, {bool isObscure = false}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
      ],
    ),
    child: TextField(
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.black54, size: 20),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
      ),
    ),
  );
}

Widget buildBrownButton(String text, VoidCallback onPressed) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6B4226),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  );
}

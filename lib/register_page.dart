import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7EEDD),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Image.asset(
                'assets/TeaMart.png',
                height: 100,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 15),
              const Text('Registration', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF3B2B20))),
              const SizedBox(height: 20),
              _buildTextField('Full name', Icons.person_outline),
              const SizedBox(height: 12),
              _buildTextField('Email Address', Icons.email_outlined),
              const SizedBox(height: 12),
              _buildTextField('Password', Icons.lock_outline, isObscure: true),
              const SizedBox(height: 12),
              _buildTextField('Phone Number', Icons.phone_outlined),
              const SizedBox(height: 12),
              _buildTextField('Address', Icons.location_on_outlined),
              const SizedBox(height: 12),
              _buildTextField('Pincode', Icons.pin_drop_outlined),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B4226),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Register', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon, {bool isObscure = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
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
}
import 'package:flutter/material.dart';

class AdminRegisterPage extends StatefulWidget {
  const AdminRegisterPage({super.key});

  @override
  State<AdminRegisterPage> createState() => _AdminRegisterPageState();
}

class _AdminRegisterPageState extends State<AdminRegisterPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3DFBE),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Section
                _buildLogo(),
                const SizedBox(height: 20),

                // Title
                const Text(
                  'Admin Registration',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF332014),
                  ),
                ),
                const SizedBox(height: 20),

                // Input Fields
                _buildTextField(
                  controller: _fullNameController,
                  hintText: 'Full name',
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: _emailController,
                  hintText: 'Email Address',
                  icon: Icons.mark_email_unread_outlined,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: _phoneController,
                  hintText: 'Phone Number',
                  icon: Icons.phone_outlined,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: _addressController,
                  hintText: 'Address',
                  icon: Icons.home_outlined,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: _pincodeController,
                  hintText: 'Pincode',
                  icon: Icons.location_on_outlined,
                ),
                const SizedBox(height: 20),

                // Register Button
                SizedBox(
                  width: 130,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF704D31),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF2D5A27), width: 2.5),
          ),
          child: const Icon(
            Icons.emoji_food_beverage_outlined,
            size: 38,
            color: Color(0xFF2D5A27),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'TeaMart',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D5A27),
            letterSpacing: 0.5,
          ),
        ),
        const Text(
          'Fresh Tea, Delivered To Your Door',
          style: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D5A27),
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(fontSize: 13),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
          prefixIcon: Icon(icon, size: 18, color: Colors.black87),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
        ),
      ),
    );
  }
}

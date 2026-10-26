import 'package:flutter/material.dart';
import 'reset_password_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleRequestPassword() {
    // આનાથી validation ચેક થશે
    if (_formKey.currentState!.validate()) {
      // Validation સફળ થતાં Reset Password પેજ પર જશે
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ResetPasswordPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7EEDD),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 25),
                // Logo
                Image.asset(
                  'assets/TeaMart.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 45),

                // Lock Illustration
                Image.asset(
                  'assets/lock-removebg-preview.png',
                  height: 125,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 45),

                // Email Input Field with Validation
                _buildEmailField(),

                const SizedBox(height: 25),

                // Request Password Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6B4226),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _handleRequestPassword,
                    child: const Text(
                      'Request to Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Back to Login Link
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    'Back to Login..',
                    style: TextStyle(
                      color: Color(0xFF1E88E5),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
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

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Email is required';
        }
        // Email Format Validation
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(value.trim())) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Email Address',
        hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        prefixIcon: const Icon(
          Icons.email_outlined,
          color: Colors.black54,
          size: 20,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        // Normal Border
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        // Error Border
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        // Red Validation Text Style
        errorStyle: const TextStyle(
          color: Colors.redAccent,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

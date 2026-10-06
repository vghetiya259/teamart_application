import 'package:flutter/material.dart';
import 'login_page.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  String errPassword = "";
  String errConfirmPassword = "";

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void validateAndReset() {
    setState(() {
      bool isValid = true;

      String password = passwordController.text;
      String confirmPassword = confirmPasswordController.text;

      // PASSWORD VALIDATION
      if (password.isEmpty) {
        errPassword = "Password is required";
        isValid = false;
      } else if (password.length < 6) {
        errPassword = "Password must be at least 6 characters";
        isValid = false;
      } else {
        errPassword = "";
      }

      // CONFIRM PASSWORD VALIDATION
      if (confirmPassword.isEmpty) {
        errConfirmPassword = "Confirm password is required";
        isValid = false;
      } else if (confirmPassword != password) {
        errConfirmPassword = "Passwords do not match";
        isValid = false;
      } else {
        errConfirmPassword = "";
      }

      // SUCCESS
      if (isValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password reset successfully!"),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7EEDD),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // LOGO
              Image.asset(
                'assets/TeaMart.png',
                height: 100,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 30),

              // RESET IMAGE
              Image.asset(
                'assets/resate-removebg-preview.png',
                height: 110,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 30),

              // PASSWORD
              _buildPasswordField(
                controller: passwordController,
                hint: 'Password',
                isVisible: isPasswordVisible,
                onToggle: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),

              if (errPassword.isNotEmpty)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4, left: 4),
                    child: Text(
                      errPassword,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                ),

              const SizedBox(height: 15),

              // CONFIRM PASSWORD
              _buildPasswordField(
                controller: confirmPasswordController,
                hint: 'Confirm Password',
                isVisible: isConfirmPasswordVisible,
                onToggle: () {
                  setState(() {
                    isConfirmPasswordVisible = !isConfirmPasswordVisible;
                  });
                },
              ),

              if (errConfirmPassword.isNotEmpty)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4, left: 4),
                    child: Text(
                      errConfirmPassword,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                ),

              const SizedBox(height: 25),

              // CONFIRM BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B4226),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: validateAndReset,
                  child: const Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hint,
    required bool isVisible,
    required VoidCallback onToggle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: !isVisible,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: Colors.black54,
            size: 20,
          ),
          suffixIcon: IconButton(
            onPressed: onToggle,
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.black54,
              size: 20,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}

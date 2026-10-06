import 'package:flutter/material.dart';

import 'register_page.dart';
import 'forgot_password_page.dart';
import 'home_page.dart';

// Admin folder ની અંદર રહેલી Admin Login Page
import 'admin/admin_login_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 1. Text Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // 2. Error Strings
  String errEmail = "";
  String errPassword = "";

  // Password Visibility Toggle
  bool isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // 3. Submit and Validation Method
  void validateAndLogin() {
    setState(() {
      bool isValid = true;

      // --- Email Validation ---
      String email = emailController.text.trim();
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );

      if (email.isEmpty) {
        errEmail = "Email is required";
        isValid = false;
      } else if (!emailRegex.hasMatch(email)) {
        errEmail = "Enter a valid email address";
        isValid = false;
      } else {
        errEmail = "";
      }

      // --- Password Validation ---
      String pwd = passwordController.text;

      if (pwd.isEmpty) {
        errPassword = "Password is required";
        isValid = false;
      } else if (pwd.length < 6) {
        errPassword = "Password must be at least 6 characters";
        isValid = false;
      } else {
        errPassword = "";
      }

      // --- Navigate to Home Page ---
      if (isValid) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // ============================================================
              // LOGO
              // ============================================================
              Center(
                child: Image.asset(
                  'assets/TeaMart.png',
                  height: 110,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 20),

              // ============================================================
              // WELCOME TEXT
              // ============================================================
              const Center(
                child: Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3B2B20),
                  ),
                ),
              ),

              const SizedBox(height: 4),

              const Center(
                child: Text(
                  'Log in to your Brewing Journey',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),

              const SizedBox(height: 25),

              // ============================================================
              // EMAIL FIELD
              // ============================================================
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.black54,
                      size: 20,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              if (errEmail.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 4.0),
                  child: Text(
                    errEmail,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),

              const SizedBox(height: 15),

              // ============================================================
              // PASSWORD FIELD
              // ============================================================
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.black54,
                      size: 20,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black54,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              if (errPassword.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 4.0),
                  child: Text(
                    errPassword,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),

              const SizedBox(height: 25),

              // ============================================================
              // LOGIN BUTTON
              // ============================================================
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
                  onPressed: validateAndLogin,
                  child: const Text(
                    'Login in to your Mart',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // ============================================================
              // FORGOT PASSWORD
              // ============================================================
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFF5A3A22),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ============================================================
              // REGISTER
              // ============================================================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // ============================================================
              // ADMIN LOGIN
              // ============================================================
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdminLoginPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Admin Login',
                    style: TextStyle(
                      color: Color(0xFF5A3A22),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

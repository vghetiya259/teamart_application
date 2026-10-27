import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controllers
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  // Password visibility
  bool _obscurePassword = true;

  // Error message variables
  String? _fullNameError;
  String? _emailError;
  String? _passwordError;
  String? _phoneError;
  String? _addressError;
  String? _pincodeError;

  void _validateAndSubmit() {
    setState(() {
      _fullNameError = null;
      _emailError = null;
      _passwordError = null;
      _phoneError = null;
      _addressError = null;
      _pincodeError = null;

      final fullName = _fullNameController.text.trim();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final phone = _phoneController.text.trim();
      final address = _addressController.text.trim();
      final pincode = _pincodeController.text.trim();

      bool isValid = true;

      // Full Name Validation
      if (fullName.isEmpty) {
        _fullNameError = 'Full name is required';
        isValid = false;
      }

      // Email Validation
      if (email.isEmpty) {
        _emailError = 'Email address is required';
        isValid = false;
      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
        _emailError = 'Please enter a valid email';
        isValid = false;
      }

      // Password Validation
      if (password.isEmpty) {
        _passwordError = 'Password is required';
        isValid = false;
      } else if (password.length < 6) {
        _passwordError = 'Password must be at least 6 characters';
        isValid = false;
      }

      // Phone Number Validation
      if (phone.isEmpty) {
        _phoneError = 'Phone number is required';
        isValid = false;
      } else if (phone.length != 10) {
        _phoneError = 'Please enter a valid 10-digit phone number';
        isValid = false;
      }

      // Address Validation
      if (address.isEmpty) {
        _addressError = 'Address is required';
        isValid = false;
      }

      // Pincode Validation
      if (pincode.isEmpty) {
        _pincodeError = 'Pincode is required';
        isValid = false;
      } else if (pincode.length != 6) {
        _pincodeError = 'Please enter a valid 6-digit pincode';
        isValid = false;
      }

      // If valid, submit/go back
      if (isValid) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _pincodeController.dispose();
    super.dispose();
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
              Image.asset(
                'assets/TeaMart.png',
                height: 100,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 15),
              const Text(
                'Registration',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B2B20),
                ),
              ),
              const SizedBox(height: 20),

              // Full Name Field
              _buildInputField(
                controller: _fullNameController,
                hintText: 'Full name',
                icon: Icons.person_outline,
                errorText: _fullNameError,
                onChanged: (_) {
                  if (_fullNameError != null) {
                    setState(() => _fullNameError = null);
                  }
                },
              ),
              const SizedBox(height: 12),

              // Email Field
              _buildInputField(
                controller: _emailController,
                hintText: 'Email Address',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                errorText: _emailError,
                onChanged: (_) {
                  if (_emailError != null) {
                    setState(() => _emailError = null);
                  }
                },
              ),
              const SizedBox(height: 12),

              // Password Field (with show/hide eye toggle)
              _buildInputField(
                controller: _passwordController,
                hintText: 'Password',
                icon: Icons.lock_outline,
                isObscure: _obscurePassword,
                errorText: _passwordError,
                isPassword: true,
                onToggleVisibility: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                onChanged: (_) {
                  if (_passwordError != null) {
                    setState(() => _passwordError = null);
                  }
                },
              ),
              const SizedBox(height: 12),

              // Phone Number Field
              _buildInputField(
                controller: _phoneController,
                hintText: 'Phone Number',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                errorText: _phoneError,
                onChanged: (_) {
                  if (_phoneError != null) {
                    setState(() => _phoneError = null);
                  }
                },
              ),
              const SizedBox(height: 12),

              // Address Field
              _buildInputField(
                controller: _addressController,
                hintText: 'Address',
                icon: Icons.location_on_outlined,
                errorText: _addressError,
                onChanged: (_) {
                  if (_addressError != null) {
                    setState(() => _addressError = null);
                  }
                },
              ),
              const SizedBox(height: 12),

              // Pincode Field
              _buildInputField(
                controller: _pincodeController,
                hintText: 'Pincode',
                icon: Icons.pin_drop_outlined,
                keyboardType: TextInputType.number,
                errorText: _pincodeError,
                onChanged: (_) {
                  if (_pincodeError != null) {
                    setState(() => _pincodeError = null);
                  }
                },
              ),
              const SizedBox(height: 25),

              // Register Button
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
                  onPressed: _validateAndSubmit,
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isObscure = false,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
    String? errorText,
    VoidCallback? onToggleVisibility,
    ValueChanged<String>? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            controller: controller,
            obscureText: isObscure,
            keyboardType: keyboardType,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
              prefixIcon: Icon(icon, color: Colors.black54, size: 20),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        isObscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black54,
                        size: 20,
                      ),
                      onPressed: onToggleVisibility,
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              errorText,
              style: const TextStyle(
                color: Color(0xFFE53935),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

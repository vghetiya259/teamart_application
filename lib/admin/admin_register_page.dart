import 'package:flutter/material.dart';

class AdminRegisterPage extends StatefulWidget {
  const AdminRegisterPage({super.key});

  @override
  State<AdminRegisterPage> createState() => _AdminRegisterPageState();
}

class _AdminRegisterPageState extends State<AdminRegisterPage> {
  // Controllers
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  // Password visibility state
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

      // Successful validation
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

                // Full Name Field
                _buildTextField(
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
                const SizedBox(height: 10),

                // Email Field
                _buildTextField(
                  controller: _emailController,
                  hintText: 'Email Address',
                  icon: Icons.mark_email_unread_outlined,
                  keyboardType: TextInputType.emailAddress,
                  errorText: _emailError,
                  onChanged: (_) {
                    if (_emailError != null) {
                      setState(() => _emailError = null);
                    }
                  },
                ),
                const SizedBox(height: 10),

                // Password Field
                _buildTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  icon: Icons.lock_outline,
                  obscureText: _obscurePassword,
                  isPassword: true,
                  errorText: _passwordError,
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
                const SizedBox(height: 10),

                // Phone Number Field
                _buildTextField(
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
                const SizedBox(height: 10),

                // Address Field
                _buildTextField(
                  controller: _addressController,
                  hintText: 'Address',
                  icon: Icons.home_outlined,
                  errorText: _addressError,
                  onChanged: (_) {
                    if (_addressError != null) {
                      setState(() => _addressError = null);
                    }
                  },
                ),
                const SizedBox(height: 10),

                // Pincode Field
                _buildTextField(
                  controller: _pincodeController,
                  hintText: 'Pincode',
                  icon: Icons.location_on_outlined,
                  keyboardType: TextInputType.number,
                  errorText: _pincodeError,
                  onChanged: (_) {
                    if (_pincodeError != null) {
                      setState(() => _pincodeError = null);
                    }
                  },
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
                    onPressed: _validateAndSubmit,
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
            color: const Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            onChanged: onChanged,
            style: const TextStyle(fontSize: 13),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
              prefixIcon: Icon(icon, size: 18, color: Colors.black87),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        size: 18,
                        color: Colors.black54,
                      ),
                      onPressed: onToggleVisibility,
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ),
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              errorText,
              style: const TextStyle(
                color: Color(0xFFE53935),
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

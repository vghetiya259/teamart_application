import 'package:flutter/material.dart';

class AdminRegisterPage extends StatefulWidget {
  const AdminRegisterPage({super.key});

  @override
  State<AdminRegisterPage> createState() => _AdminRegisterPageState();
}

class _AdminRegisterPageState extends State<AdminRegisterPage> {
  // CONTROLLERS
  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _pincodeController = TextEditingController();

  // ERROR MESSAGES
  String _nameError = '';
  String _emailError = '';
  String _passwordError = '';
  String _phoneError = '';
  String _addressError = '';
  String _pincodeError = '';

  bool _isPasswordVisible = false;

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

  void _handleRegister() {
    FocusScope.of(context).unfocus();

    setState(() {
      bool isValid = true;

      String name = _fullNameController.text.trim();
      String email = _emailController.text.trim();
      String password = _passwordController.text;
      String phone = _phoneController.text.trim();
      String address = _addressController.text.trim();
      String pincode = _pincodeController.text.trim();

      // REGEX
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );

      final phoneRegex = RegExp(r'^[0-9]{10}$');

      final pincodeRegex = RegExp(r'^[0-9]{6}$');

      // -------------------------
      // FULL NAME VALIDATION
      // -------------------------
      if (name.isEmpty) {
        _nameError = 'Full name is required';
        isValid = false;
      } else if (name.length < 2) {
        _nameError = 'Enter a valid full name';
        isValid = false;
      } else {
        _nameError = '';
      }

      // -------------------------
      // EMAIL VALIDATION
      // -------------------------
      if (email.isEmpty) {
        _emailError = 'Email is required';
        isValid = false;
      } else if (!emailRegex.hasMatch(email)) {
        _emailError = 'Enter a valid email address';
        isValid = false;
      } else {
        _emailError = '';
      }

      // -------------------------
      // PASSWORD VALIDATION
      // -------------------------
      if (password.isEmpty) {
        _passwordError = 'Password is required';
        isValid = false;
      } else if (password.length < 6) {
        _passwordError = 'Password must be at least 6 characters';
        isValid = false;
      } else {
        _passwordError = '';
      }

      // -------------------------
      // PHONE VALIDATION
      // -------------------------
      if (phone.isEmpty) {
        _phoneError = 'Phone number is required';
        isValid = false;
      } else if (!phoneRegex.hasMatch(phone)) {
        _phoneError = 'Phone number must be exactly 10 digits';
        isValid = false;
      } else {
        _phoneError = '';
      }

      // -------------------------
      // ADDRESS VALIDATION
      // -------------------------
      if (address.isEmpty) {
        _addressError = 'Address is required';
        isValid = false;
      } else if (address.length < 5) {
        _addressError = 'Enter a valid address';
        isValid = false;
      } else {
        _addressError = '';
      }

      // -------------------------
      // PINCODE VALIDATION
      // -------------------------
      if (pincode.isEmpty) {
        _pincodeError = 'Pincode is required';
        isValid = false;
      } else if (!pincodeRegex.hasMatch(pincode)) {
        _pincodeError = 'Pincode must be exactly 6 digits';
        isValid = false;
      } else {
        _pincodeError = '';
      }

      // -------------------------
      // SUCCESS
      // -------------------------
      if (isValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Admin registration successful!'),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pop(context);
      }
    });
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
                // LOGO
                _buildLogo(),

                const SizedBox(height: 20),

                // TITLE
                const Text(
                  'Admin Registration',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF332014),
                  ),
                ),

                const SizedBox(height: 20),

                // FULL NAME
                _buildTextField(
                  controller: _fullNameController,
                  hintText: 'Full name',
                  icon: Icons.person_outline,
                ),

                _buildErrorText(_nameError),

                const SizedBox(height: 10),

                // EMAIL
                _buildTextField(
                  controller: _emailController,
                  hintText: 'Email Address',
                  icon: Icons.mark_email_unread_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),

                _buildErrorText(_emailError),

                const SizedBox(height: 10),

                // PASSWORD
                _buildPasswordField(),

                _buildErrorText(_passwordError),

                const SizedBox(height: 10),

                // PHONE
                _buildTextField(
                  controller: _phoneController,
                  hintText: 'Phone Number',
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                ),

                _buildErrorText(_phoneError),

                const SizedBox(height: 10),

                // ADDRESS
                _buildTextField(
                  controller: _addressController,
                  hintText: 'Address',
                  icon: Icons.home_outlined,
                  maxLines: 2,
                ),

                _buildErrorText(_addressError),

                const SizedBox(height: 10),

                // PINCODE
                _buildTextField(
                  controller: _pincodeController,
                  hintText: 'Pincode',
                  icon: Icons.location_on_outlined,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                ),

                _buildErrorText(_pincodeError),

                const SizedBox(height: 20),

                // REGISTER BUTTON
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
                    onPressed: _handleRegister,
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

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ERROR TEXT
  Widget _buildErrorText(String error) {
    if (error.isEmpty) {
      return const SizedBox.shrink();
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 4, left: 4),
        child: Text(
          error,
          style: const TextStyle(color: Colors.red, fontSize: 12),
        ),
      ),
    );
  }

  // PASSWORD FIELD
  Widget _buildPasswordField() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _passwordController,
        obscureText: !_isPasswordVisible,
        style: const TextStyle(fontSize: 13, color: Colors.black87),
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
          prefixIcon: const Icon(
            Icons.lock_outline,
            size: 18,
            color: Colors.black87,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              size: 18,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
        ),
      ),
    );
  }

  // NORMAL TEXT FIELD
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    int? maxLength,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        maxLength: maxLength,
        style: const TextStyle(fontSize: 13, color: Colors.black87),
        decoration: InputDecoration(
          hintText: hintText,
          counterText: '',
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

  // LOGO
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
}

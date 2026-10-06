import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // CONTROLLERS
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController pincodeController = TextEditingController();

  // ERROR STRINGS
  String errName = "";
  String errEmail = "";
  String errPassword = "";
  String errPhone = "";
  String errAddress = "";
  String errPincode = "";

  bool isPasswordVisible = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    addressController.dispose();
    pincodeController.dispose();

    super.dispose();
  }

  void validateAndRegister() {
    setState(() {
      bool isValid = true;

      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text;
      String phone = phoneController.text.trim();
      String address = addressController.text.trim();
      String pincode = pincodeController.text.trim();

      // EMAIL REGEX
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );

      // PHONE REGEX
      final phoneRegex = RegExp(r'^[0-9]{10}$');

      // PINCODE REGEX
      final pincodeRegex = RegExp(r'^[0-9]{6}$');

      // NAME VALIDATION
      if (name.isEmpty) {
        errName = "Full name is required";
        isValid = false;
      } else if (name.length < 2) {
        errName = "Enter a valid name";
        isValid = false;
      } else {
        errName = "";
      }

      // EMAIL VALIDATION
      if (email.isEmpty) {
        errEmail = "Email is required";
        isValid = false;
      } else if (!emailRegex.hasMatch(email)) {
        errEmail = "Enter a valid email address";
        isValid = false;
      } else {
        errEmail = "";
      }

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

      // PHONE VALIDATION
      if (phone.isEmpty) {
        errPhone = "Phone number is required";
        isValid = false;
      } else if (!phoneRegex.hasMatch(phone)) {
        errPhone = "Phone number must be exactly 10 digits";
        isValid = false;
      } else {
        errPhone = "";
      }

      // ADDRESS VALIDATION
      if (address.isEmpty) {
        errAddress = "Address is required";
        isValid = false;
      } else if (address.length < 5) {
        errAddress = "Enter a valid address";
        isValid = false;
      } else {
        errAddress = "";
      }

      // PINCODE VALIDATION
      if (pincode.isEmpty) {
        errPincode = "Pincode is required";
        isValid = false;
      } else if (!pincodeRegex.hasMatch(pincode)) {
        errPincode = "Pincode must be exactly 6 digits";
        isValid = false;
      } else {
        errPincode = "";
      }

      // ALL VALID
      if (isValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Registration successful!"),
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
      backgroundColor: const Color(0xFFF7EEDD),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // LOGO
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

              // FULL NAME
              _buildTextField(
                controller: nameController,
                hint: 'Full name',
                icon: Icons.person_outline,
              ),

              _errorText(errName),

              const SizedBox(height: 12),

              // EMAIL
              _buildTextField(
                controller: emailController,
                hint: 'Email Address',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),

              _errorText(errEmail),

              const SizedBox(height: 12),

              // PASSWORD
              _buildPasswordField(),

              _errorText(errPassword),

              const SizedBox(height: 12),

              // PHONE
              _buildTextField(
                controller: phoneController,
                hint: 'Phone Number',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                maxLength: 10,
              ),

              _errorText(errPhone),

              const SizedBox(height: 12),

              // ADDRESS
              _buildTextField(
                controller: addressController,
                hint: 'Address',
                icon: Icons.location_on_outlined,
                maxLines: 2,
              ),

              _errorText(errAddress),

              const SizedBox(height: 12),

              // PINCODE
              _buildTextField(
                controller: pincodeController,
                hint: 'Pincode',
                icon: Icons.pin_drop_outlined,
                keyboardType: TextInputType.number,
                maxLength: 6,
              ),

              _errorText(errPincode),

              const SizedBox(height: 25),

              // REGISTER BUTTON
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
                  onPressed: validateAndRegister,
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 16),
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

  Widget _errorText(String error) {
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    int? maxLength,
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
        keyboardType: keyboardType,
        maxLines: maxLines,
        maxLength: maxLength,
        decoration: InputDecoration(
          hintText: hint,
          counterText: "",
          hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
          prefixIcon: Icon(icon, color: Colors.black54, size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 10,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: TextField(
        controller: passwordController,
        obscureText: !isPasswordVisible,
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: Colors.black54,
            size: 20,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.black54,
              size: 20,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 10,
          ),
        ),
      ),
    );
  }
}

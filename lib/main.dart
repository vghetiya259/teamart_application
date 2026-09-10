import 'package:flutter/material.dart';
import 'admin_login_page.dart';

void main() {
  runApp(const TeaMartAdminApp());
}

class TeaMartAdminApp extends StatelessWidget {
  const TeaMartAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TeaMart Admin',
      home: const AdminLoginPage(), // Default page set to Admin Login
    );
  }
}

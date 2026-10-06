import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'add_products_page.dart';
import 'edit_products_page.dart';
import 'admin_profile_page.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  static const Color bgColor = Color(0xFFF2D6AB);
  static const Color darkBrown = Color(0xFF4A2E18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: const AppDrawer(currentPage: 'Users'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, color: darkBrown, size: 26),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),

                  // Admin Profile Redirection
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AdminProfilePage(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(0xFFE2BE8D),
                      child: Text(
                        'A',
                        style: TextStyle(
                          color: darkBrown,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Center(
                child: Column(
                  children: const [
                    Icon(Icons.eco_rounded, color: Color(0xFF2E5A1C), size: 36),
                    Text(
                      'TeaMart',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E5A1C),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'User Management',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: darkBrown,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 38,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddProductsPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add, size: 16, color: Colors.white),
                  label: const Text(
                    'Add New User',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkBrown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Registered Users',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: darkBrown,
                ),
              ),
              const SizedBox(height: 10),
              _buildUserCard(
                context,
                id: 'ID: #USR-1042',
                name: 'Elena Rodriguez',
                role: 'ADMIN',
                roleBg: const Color(0xFFE8F5E9),
                roleColor: const Color(0xFF2E7D32),
                email: 'elena.rg@temart.com',
                phone: '(555) 123-4567',
              ),
              const SizedBox(height: 12),
              _buildUserCard(
                context,
                id: 'ID: #USR-1043',
                name: 'Marcus Johnson',
                role: 'Customer',
                roleBg: const Color(0xFFE3F2FD),
                roleColor: const Color(0xFF1976D2),
                email: 'mjohnson@example.com',
                phone: '(555) 987-6543',
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildUserCard(
    BuildContext context, {
    required String id,
    required String name,
    required String role,
    required Color roleBg,
    required Color roleColor,
    required String email,
    required String phone,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(id, style: const TextStyle(fontSize: 9, color: Colors.grey)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: roleBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  role,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: roleColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: darkBrown,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '✉ $email',
            style: const TextStyle(fontSize: 10.5, color: Colors.black87),
          ),
          const SizedBox(height: 3),
          Text(
            '☎ $phone',
            style: const TextStyle(fontSize: 10.5, color: Colors.black87),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProductsPage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 26,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBE9E7),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: darkBrown,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Container(
                  height: 26,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Text(
                      'View',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: darkBrown,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Container(
                  height: 26,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

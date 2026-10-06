import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'users_page.dart';
import 'order_page.dart';
import 'admin_products_page.dart';
import 'add_products_page.dart';

import 'admin_login_page.dart';

class AppDrawer extends StatelessWidget {
  final String currentPage;

  const AppDrawer({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    const Color darkBrown = Color(0xFF332014);

    return Drawer(
      backgroundColor: const Color(0xFFFDF6EC),
      child: Column(
        children: [
          // ============================================================
          // ADMIN HEADER
          // ============================================================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            color: const Color(0xFFE2BE8D),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: darkBrown,
                  child: Icon(Icons.local_cafe, color: Colors.white, size: 28),
                ),

                SizedBox(height: 12),

                Text(
                  'TeaMart Admin',
                  style: TextStyle(
                    color: darkBrown,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'admin@teamart.com',
                  style: TextStyle(color: Colors.brown, fontSize: 12),
                ),
              ],
            ),
          ),

          // ============================================================
          // MENU ITEMS
          // ============================================================
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _buildItem(
                  context,
                  icon: Icons.dashboard_outlined,
                  title: 'Dashboard',
                  page: const DashboardScreen(),
                  isSelected: currentPage == 'Dashboard',
                ),

                _buildItem(
                  context,
                  icon: Icons.people_outline,
                  title: 'Users Management',
                  page: const UsersPage(),
                  isSelected: currentPage == 'Users',
                ),

                _buildItem(
                  context,
                  icon: Icons.shopping_bag_outlined,
                  title: 'Orders',
                  page: const OrderPage(),
                  isSelected: currentPage == 'Orders',
                ),

                _buildItem(
                  context,
                  icon: Icons.inventory_2_outlined,
                  title: 'Products (Stock)',
                  page: const AdminProductsPage(),
                  isSelected: currentPage == 'Products',
                ),

                _buildItem(
                  context,
                  icon: Icons.add_box_outlined,
                  title: 'Add New Product',
                  page: const AddProductsPage(),
                  isSelected: currentPage == 'AddProduct',
                ),
              ],
            ),
          ),

          // ============================================================
          // LOGOUT BUTTON
          // ============================================================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFE2BE8D), width: 1),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminLoginPage(),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B3A2B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                icon: const Icon(Icons.logout_outlined, size: 20),
                label: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // DRAWER MENU ITEM
  // ============================================================
  Widget _buildItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Widget page,
    required bool isSelected,
  }) {
    return ListTile(
      selected: isSelected,

      selectedTileColor: const Color(0xFFE2BE8D).withOpacity(0.3),

      leading: Icon(icon, color: const Color(0xFF4A2E18), size: 22),

      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF4A2E18),
        ),
      ),

      onTap: () {
        // Drawer close
        Navigator.pop(context);

        if (!isSelected) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
    );
  }
}



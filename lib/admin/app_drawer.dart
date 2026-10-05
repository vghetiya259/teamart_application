import 'package:flutter/material.dart';
import '../dashboard.dart';
import 'users_page.dart';
import 'order_page.dart';
import 'admin_products_page.dart';
import 'add_products_page.dart';
import 'edit_products_page.dart';

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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            color: const Color(0xFFE2BE8D),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
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
                _buildItem(
                  context,
                  icon: Icons.edit_note_outlined,
                  title: 'Edit Product',
                  page: const EditProductsPage(),
                  isSelected: currentPage == 'EditProduct',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
        Navigator.pop(context); // Drawer બંધ થશે
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

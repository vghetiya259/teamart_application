import 'package:flutter/material.dart';

import 'app_drawer.dart';

import 'add_products_page.dart';

import 'edit_products_page.dart';

import 'admin_profile_page.dart';

class AdminProductsPage extends StatelessWidget {
  const AdminProductsPage({super.key});

  static const Color bgColor = Color(0xFFF2D6AB);

  static const Color darkBrown = Color(0xFF4A2E18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: const AppDrawer(currentPage: 'Products'),
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
              const SizedBox(height: 14),
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
                    'Add New Product',
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
                'Current Stock',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: darkBrown,
                ),
              ),
              const SizedBox(height: 10),
              _buildStockCard(
                context,
                id: 'ID: #PRD-1041',
                name: 'Cappuccino',
                category: 'Hot Beverages',
                price: '₹ 4.50',
                status: 'In Stock',
                isLowStock: false,
              ),
              const SizedBox(height: 12),
              _buildStockCard(
                context,
                id: 'ID: #PRD-1042',
                name: 'Almond Croissant',
                category: 'Pastries',
                price: '₹ 3.25',
                status: 'Low Stock',
                isLowStock: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildStockCard(
    BuildContext context, {
    required String id,
    required String name,
    required String category,
    required String price,
    required String status,
    required bool isLowStock,
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
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: isLowStock
                      ? const Color(0xFFFFEBEE)
                      : const Color(0xFFFFF8E1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 8.5,
                    fontWeight: FontWeight.bold,
                    color: isLowStock ? Colors.red : Colors.orange.shade800,
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
          Text(
            category,
            style: const TextStyle(fontSize: 9.5, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: darkBrown,
            ),
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
                      color: const Color(0xFFFFF3E0),
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
              const SizedBox(width: 8),
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

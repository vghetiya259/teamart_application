import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'admin_profile_page.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  static const Color bgColor = Color(0xFFF2D6AB);
  static const Color darkBrown = Color(0xFF4A2E18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: const AppDrawer(currentPage: 'Orders'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
          child: Column(
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
              const Text(
                'My Orders',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: darkBrown,
                ),
              ),
              const SizedBox(height: 12),
              _buildOrderCard(
                orderId: 'Order #TMT101',
                date: 'Date: 12-Apr-2024',
                status: 'Status: Shipped',
                total: 'Total: ₹ 1,285.00',
                items: ['1x Darjeeling First Flush', '2x Assam Black Tea'],
              ),
              const SizedBox(height: 12),
              _buildOrderCard(
                orderId: 'Order #TMT100',
                date: 'Date: 10-Apr-2024',
                status: 'Delivered',
                total: 'Total: ₹ 1,250.00',
                items: ['1x Darjeeling First Flush', '2x Assam Black Tea'],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildOrderCard({
    required String orderId,
    required String date,
    required String status,
    required String total,
    required List<String> items,
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
              Text(
                orderId,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: darkBrown,
                ),
              ),
              Text(
                status,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5A442E),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: const TextStyle(fontSize: 9, color: Colors.grey),
              ),
              Text(
                total,
                style: const TextStyle(
                  fontSize: 9.5,
                  fontWeight: FontWeight.bold,
                  color: darkBrown,
                ),
              ),
            ],
          ),
          const Divider(height: 16),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  const Icon(Icons.eco, size: 14, color: Colors.green),
                  const SizedBox(width: 8),
                  Text(
                    item,
                    style: const TextStyle(
                      fontSize: 10.5,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: double.infinity,
            height: 32,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDEB887),
                foregroundColor: darkBrown,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Track Order',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

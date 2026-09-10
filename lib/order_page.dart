import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Toggle Tab
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: const Color(0xFFE4CCAA),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A2E2B),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Center(
                      child: Text(
                        'Ongoing Order',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Completed Orders',
                      style: TextStyle(
                        color: Colors.brown[800],
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Ongoing Card
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ORDER ID: #8203014',
                      style: TextStyle(fontSize: 9, color: Colors.grey),
                    ),
                    Text(
                      '23 Dec 2024, 10:15 AM',
                      style: TextStyle(fontSize: 9, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'PREPARING',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.location_on,
                        size: 12,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Track Order',
                        style: TextStyle(fontSize: 9, color: Colors.black),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 16),
                _orderItemRow(
                  'Cappuccino',
                  '1x | Regular | White Sugar',
                  '₹ 120',
                  'https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=200',
                ),
                _orderItemRow(
                  'Iced Latte',
                  '1x | Large | Caramel Syrup',
                  '₹ 320',
                  'https://images.unsplash.com/photo-1517701604599-bb29b565090c?w=200',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Completed Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Completed Orders',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C2415),
                ),
              ),
              Text(
                'View All',
                style: TextStyle(fontSize: 10, color: Colors.orange[800]),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'COMPLETED',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                _orderItemRow(
                  'Espresso',
                  'Double Shot',
                  '₹ 120',
                  'https://images.unsplash.com/photo-1510591509098-f4fdc6d0ff04?w=200',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderItemRow(String title, String sub, String price, String imgUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              imgUrl,
              width: 38,
              height: 38,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  sub,
                  style: const TextStyle(fontSize: 9, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
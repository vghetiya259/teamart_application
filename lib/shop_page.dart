import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {'name': 'Cappuccino', 'desc': 'Smooth & Creamy', 'price': '₹ 180', 'img': 'https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=300'},
      {'name': 'Iced Latte', 'desc': 'Chilled & Refreshing', 'price': '₹ 200', 'img': 'https://images.unsplash.com/photo-1517701604599-bb29b565090c?w=300'},
      {'name': 'Matcha Latte', 'desc': 'Pure & Green', 'price': '₹ 190', 'img': 'https://images.unsplash.com/photo-1536256263959-770b48d82b0a?w=300'},
      {'name': 'Espresso', 'desc': 'Strong & Bold', 'price': '₹ 120', 'img': 'https://images.unsplash.com/photo-1510591509098-f4fdc6d0ff04?w=300'},
    ];

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text('Shop', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF3C201A))),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Featured Products', style: TextStyle(fontSize: 12, color: Colors.grey)),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.72,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final p = products[index];
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(p['img']!, height: 110, width: double.infinity, fit: BoxFit.cover),
                          ),
                          Positioned(
                            top: 6, right: 6,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white.withOpacity(0.8),
                              child: const Icon(Icons.favorite_border, size: 14, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(p['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      Text(p['desc']!, style: const TextStyle(fontSize: 9, color: Colors.grey)),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(p['price']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(color: const Color(0xFF3C201A), borderRadius: BorderRadius.circular(6)),
                            child: const Icon(Icons.add, color: Colors.white, size: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
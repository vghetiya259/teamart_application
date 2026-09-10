import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  final List<Map<String, String>> _products = const [
    {
      'title': 'Cappuccino',
      'sub': 'Smooth & Creamy',
      'price': '₹ 185',
      'image':
          'https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=300',
    },
    {
      'title': 'Iced Latte',
      'sub': 'Intense Refreshing',
      'price': '₹ 220',
      'image':
          'https://images.unsplash.com/photo-1517701604599-bb29b565090c?w=300',
    },
    {
      'title': 'Matcha Latte',
      'sub': 'Fresh & Green',
      'price': '₹ 190',
      'image':
          'https://images.unsplash.com/photo-1536256263959-770b48d82b0a?w=300',
    },
    {
      'title': 'Espresso',
      'sub': 'Strong & Bold',
      'price': '₹ 120',
      'image':
          'https://images.unsplash.com/photo-1510591509098-f4fdc6d0ff04?w=300',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Shop',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Serif',
              color: Color(0xFF3C2415),
            ),
          ),
          const Text(
            'Featured Products',
            style: TextStyle(fontSize: 11, color: Colors.brown),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.82,
            ),
            itemBuilder: (context, index) {
              final item = _products[index];
              return _shopItem(
                item['title']!,
                item['sub']!,
                item['price']!,
                item['image']!,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _shopItem(String title, String sub, String price, String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  height: 95,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    size: 14,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Text(sub, style: const TextStyle(fontSize: 9, color: Colors.grey)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFF4A2E2B),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.add, size: 14, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Welcome, [User Name]!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF3C201A)),
            ),
          ),
          const SizedBox(height: 15),

          // Hero Banner
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1544787219-7f47ccb76574?w=500'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Elegance In\nEvery Bloom.', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Unwind with a warm brew for your soul.', style: TextStyle(color: Colors.white70, fontSize: 10)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Explore Categories
          const Text('Explore Categories', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF3C201A))),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _categoryCard('Gourmet Coffee', 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=300')),
              const SizedBox(width: 12),
              Expanded(child: _categoryCard('Premium Tea', 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=300')),
            ],
          ),
          const SizedBox(height: 20),

          // Top Rated Brews
          const Text('Top Rated Brews', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF3C201A))),
          const SizedBox(height: 10),
          SizedBox(
            height: 170,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _topBrewCard('Vanilla Latte', '4.5', '₹1.00', 'https://images.unsplash.com/photo-1534778101976-62847782c213?w=300'),
                _topBrewCard('Chai Latte', '4.8', '₹7.00', 'https://images.unsplash.com/photo-1578899952107-9c390f1af1b7?w=300'),
                _topBrewCard('Green Tea', '4.6', '₹3.00', 'https://images.unsplash.com/photo-1564890369478-c89ca6d9cde9?w=300'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryCard(String title, String imageUrl) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
        ),
        child: Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _topBrewCard(String title, String rating, String price, String imageUrl) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(imageUrl, height: 75, width: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 12),
              Text(rating, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(color: const Color(0xFF3C201A), borderRadius: BorderRadius.circular(6)),
                child: const Icon(Icons.add, color: Colors.white, size: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
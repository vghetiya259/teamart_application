import 'package:flutter/material.dart';

import 'home_page.dart';
import 'order_page.dart';
import 'profile_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final int _currentIndex = 1;

  final List<Map<String, String>> _products = const [
    {
      'title': 'Cappuccino',
      'sub': 'Smooth & Creamy',
      'price': '₹ 180',
      'image': 'assets/rb1.png',
    },
    {
      'title': 'Iced Latte',
      'sub': 'Chilled & Refreshing',
      'price': '₹ 200',
      'image': 'assets/rb1.png',
    },
    {
      'title': 'Matcha Latte',
      'sub': 'Pure & Green',
      'price': '₹ 190',
      'image': 'assets/rb2.png',
    },
    {
      'title': 'Espresso',
      'sub': 'Strong & Bold',
      'price': '₹ 120',
      'image': 'assets/rb3.png',
    },
    {
      'title': 'Mocha',
      'sub': 'Rich Chocolate & Coffee',
      'price': '₹ 210',
      'image': 'assets/home1.png',
    },
    {
      'title': 'Coffee Beans',
      'sub': 'Fresh Roasted Blend',
      'price': '₹ 350',
      'image': 'assets/home2.png',
    },
  ];

  void _onNavTap(int index) {
    if (index == _currentIndex) {
      return;
    }

    Widget nextPage;

    switch (index) {
      case 0:
        nextPage = const HomePage();
        break;

      case 2:
        nextPage = const OrderPage();
        break;

      case 3:
        nextPage = const ProfilePage();
        break;

      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => nextPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1D7B0),

      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Shop',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Serif',
                  color: Color(0xFF2C1608),
                ),
              ),

              const SizedBox(height: 4),

              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 4, bottom: 12),
                  child: Text(
                    'Featured Products',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Serif',
                      color: Color(0xFF2C1608),
                    ),
                  ),
                ),
              ),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.77,
                ),
                itemBuilder: (context, index) {
                  final item = _products[index];

                  return _shopCard(
                    item['title']!,
                    item['sub']!,
                    item['price']!,
                    item['image']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      color: const Color(0xFFF1D7B0),
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: Container(
        height: 62,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.black.withOpacity(0.08)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(
              icon: Icons.home_outlined,
              activeIcon: Icons.home,
              label: 'Home',
              index: 0,
            ),
            _buildNavItem(
              icon: Icons.shopping_bag_outlined,
              activeIcon: Icons.shopping_bag,
              label: 'Shop',
              index: 1,
            ),
            _buildNavItem(
              icon: Icons.assignment_outlined,
              activeIcon: Icons.assignment,
              label: 'My Orders',
              index: 2,
            ),
            _buildNavItem(
              icon: Icons.person_outline,
              activeIcon: Icons.person,
              label: 'Profile',
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final bool isSelected = _currentIndex == index;

    final Color itemColor = isSelected
        ? const Color(0xFF2C1608)
        : Colors.grey.shade500;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onNavTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(isSelected ? activeIcon : icon, color: itemColor, size: 22),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: itemColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _shopCard(String title, String sub, String price, String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  imageUrl,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 100,
                      color: const Color(0xFFE9DEC8),
                      child: const Center(
                        child: Icon(Icons.coffee, color: Colors.brown),
                      ),
                    );
                  },
                ),
              ),

              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  padding: const EdgeInsets.all(4.5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite_border_rounded,
                    size: 15,
                    color: Color(0xFF2C1608),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 7),

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E110A),
            ),
          ),

          Text(
            sub,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 9.5, color: Colors.grey.shade600),
          ),

          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E110A),
                ),
              ),

              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: const Color(0xFF24140D),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: const Icon(Icons.add, size: 16, color: Colors.white),
              ),
            ],
          ),

          const SizedBox(height: 2),
        ],
      ),
    );
  }
}

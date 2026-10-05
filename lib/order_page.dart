import 'package:flutter/material.dart';

import 'home_page.dart';
import 'shop_page.dart';
import 'profile_page.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  void _onNavTap(BuildContext context, int index) {
    Widget? nextPage;

    switch (index) {
      case 0:
        nextPage = const HomePage();
        break;

      case 1:
        nextPage = const ShopPage();
        break;

      case 2:
        return;

      case 3:
        nextPage = const ProfilePage();
        break;
    }

    if (nextPage != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => nextPage!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1D7B0),

      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'My Orders',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Serif',
                    color: Color(0xFF3C2415),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // TOGGLE
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
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Completed Orders',
                          style: TextStyle(
                            color: Color(0xFF5D3824),
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

              // ONGOING ORDER
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

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Container(
      color: const Color(0xFFF1D7B0),
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: Container(
        height: 62,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
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
            _navItem(context, Icons.home_outlined, Icons.home, 'Home', 0),
            _navItem(
              context,
              Icons.shopping_bag_outlined,
              Icons.shopping_bag,
              'Shop',
              1,
            ),
            _navItem(
              context,
              Icons.receipt_long_outlined,
              Icons.receipt_long,
              'My Orders',
              2,
            ),
            _navItem(context, Icons.person_outline, Icons.person, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  Widget _navItem(
    BuildContext context,
    IconData icon,
    IconData activeIcon,
    String label,
    int index,
  ) {
    const selectedColor = Color(0xFF332019);
    final bool selected = index == 2;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onNavTap(context, index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              selected ? activeIcon : icon,
              size: 22,
              color: selected ? selectedColor : Colors.grey.shade500,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: selected ? FontWeight.bold : FontWeight.w500,
                color: selected ? selectedColor : Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderItemRow(String title, String sub, String price, String imgUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              imgUrl,
              width: 38,
              height: 38,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 38,
                  height: 38,
                  color: Colors.brown.shade100,
                  child: const Icon(Icons.coffee, size: 18),
                );
              },
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

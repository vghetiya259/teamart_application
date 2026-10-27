import 'package:flutter/material.dart';

import 'home_page.dart';
import 'shop_page.dart';
import 'order_page.dart';
import 'login_page.dart';

import 'personal_info_page.dart';
import 'address_page.dart';
import 'payment_methods_page.dart';
import 'rewards_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final int _currentIndex = 3;

  String name = 'Sujal Desai';
  String email = 'sujaldesai@email.com';
  String phone = '+91 98755 43210';

  void _onNavTap(int index) {
    if (index == _currentIndex) {
      return;
    }

    Widget nextPage;

    switch (index) {
      case 0:
        nextPage = const HomePage();
        break;

      case 1:
        nextPage = const ShopPage();
        break;

      case 2:
        nextPage = const OrderPage();
        break;

      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => nextPage),
    );
  }

  // ============================================================
  // LOGOUT
  // ============================================================
  void _logout() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF1D7B0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Text(
            'Logout',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF3C2415),
            ),
          ),
          content: const Text(
            'Are you sure you want to logout?',
            style: TextStyle(fontSize: 14, color: Color(0xFF5D3824)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Color(0xFF4A2E2B)),
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4A2E2B),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // Dialog close
                Navigator.pop(dialogContext);

                // Login page redirect
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
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
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Serif',
                  color: Color(0xFF3C2415),
                ),
              ),

              const SizedBox(height: 12),

              // PROFILE IMAGE
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300',
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xFF4A2E2B),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Text(
                name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C2415),
                ),
              ),

              Text(
                email,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),

              Text(
                phone,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),

              const SizedBox(height: 16),

              // PERSONAL INFORMATION
              _menuItem(
                icon: Icons.person_outline,
                title: 'Personal Information',
                sub: 'Name, email, phone number',
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PersonalInfoPage(
                        name: name,
                        email: email,
                        phone: phone,
                      ),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      name = result['name'];
                      email = result['email'];
                      phone = result['phone'];
                    });
                  }
                },
              ),

              // ADDRESS
              _menuItem(
                icon: Icons.location_on_outlined,
                title: 'Addresses',
                sub: 'Manage your saved addresses',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddressPage()),
                  );
                },
              ),

              // PAYMENT
              _menuItem(
                icon: Icons.credit_card,
                title: 'Payment Methods',
                sub: 'Cash on Delivery',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PaymentMethodsPage(),
                    ),
                  );
                },
              ),

              // REWARDS
              _menuItem(
                icon: Icons.card_giftcard,
                title: 'Rewards & Points',
                sub: '150 reward points available',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RewardsPage()),
                  );
                },
              ),

              // LOGOUT
              _menuItem(
                icon: Icons.logout,
                title: 'Logout',
                sub: 'Sign out from your account',
                isLogout: true,
                onTap: _logout,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================

  Widget _bottomNavigationBar() {
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
            _navItem(Icons.home_outlined, Icons.home, 'Home', 0),
            _navItem(
              Icons.shopping_bag_outlined,
              Icons.shopping_bag,
              'Shop',
              1,
            ),
            _navItem(
              Icons.receipt_long_outlined,
              Icons.receipt_long,
              'My Orders',
              2,
            ),
            _navItem(Icons.person_outline, Icons.person, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, IconData activeIcon, String label, int index) {
    final bool selected = index == _currentIndex;

    final Color color = selected
        ? const Color(0xFF332019)
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
            Icon(selected ? activeIcon : icon, color: color, size: 22),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: selected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // PROFILE MENU ITEM
  // ============================================================

  Widget _menuItem({
    required IconData icon,
    required String title,
    required String sub,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isLogout ? Colors.red[50] : Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 16,
            color: isLogout ? Colors.red : const Color(0xFF4A2E2B),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: isLogout ? Colors.red : Colors.black87,
          ),
        ),
        subtitle: Text(
          sub,
          style: const TextStyle(fontSize: 9, color: Colors.grey),
        ),
        trailing: const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
      ),
    );
  }
}

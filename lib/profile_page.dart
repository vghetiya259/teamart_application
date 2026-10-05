import 'package:flutter/material.dart';
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
  String name = 'Sujal Desai';
  String email = 'sujaldesai@email.com';
  String phone = '+91 98755 43210';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Serif',
                color: Color(0xFF3C2415),
              ),
            ),
            const SizedBox(height: 12),

            // Profile Header
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

            // Navigation Items
            _menuItem(
              icon: Icons.person_outline,
              title: 'Personal Information',
              sub: 'Name, email, phone number',
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalInfoPage(
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
            _menuItem(
              icon: Icons.location_on_outlined,
              title: 'Addresses',
              sub: 'Manage your saved addresses',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddressPage()),
                );
              },
            ),
            _menuItem(
              icon: Icons.credit_card,
              title: 'Payment Methods',
              sub: 'Cash on Delivery',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentMethodsPage(),
                  ),
                );
              },
            ),
            _menuItem(
              icon: Icons.card_giftcard,
              title: 'Rewards & Points',
              sub: '150 reward points available',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RewardsPage()),
                );
              },
            ),
            _menuItem(
              icon: Icons.logout,
              title: 'Logout',
              sub: 'Sign out from your account',
              isLogout: true,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logged out successfully')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

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

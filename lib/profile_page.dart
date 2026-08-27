import 'package:flutter/material.dart';
import 'personal_info_page.dart';
import 'addresses_page.dart';
import 'payment_methods_page.dart';
import 'rewards_page.dart';
import 'privacy_security_page.dart';
import 'help_support_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3C201A),
            ),
          ),
          const SizedBox(height: 15),

          Stack(
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: const Color(0xFF3C201A),
                  child: const Icon(Icons.edit, size: 10, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Sujal Desai',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Text(
            'sujaldesai@email.com',
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
          const Text(
            '+91 98765 43210',
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
          const SizedBox(height: 20),

          _profileOption(
            context,
            Icons.person_outline,
            'Personal Information',
            'Name, email, phone number',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PersonalInfoPage()),
            ),
          ),
          _profileOption(
            context,
            Icons.location_on_outlined,
            'Addresses',
            'Manage your saved addresses',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddressesPage()),
            ),
          ),
          _profileOption(
            context,
            Icons.payment,
            'Payment Methods',
            'Cards, UPI, and more',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PaymentMethodsPage(),
              ),
            ),
          ),
          _profileOption(
            context,
            Icons.card_giftcard,
            'Rewards & Points',
            'View your points and rewards',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RewardsPage()),
            ),
          ),
          _profileOption(
            context,
            Icons.lock_outline,
            'Privacy & Security',
            'Change password, security settings',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PrivacySecurityPage(),
              ),
            ),
          ),
          _profileOption(
            context,
            Icons.help_outline,
            'Help & Support',
            'FAQs, contact us',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HelpSupportPage()),
            ),
          ),
          _profileOption(
            context,
            Icons.logout,
            'Logout',
            'Sign out from your account',
            isLogout: true,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out successfully')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _profileOption(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle, {
    bool isLogout = false,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isLogout ? Colors.red : const Color(0xFF3C201A),
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: isLogout ? Colors.red : Colors.black,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.grey, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'admin_profile_page.dart';
import 'app_drawer.dart';
import 'order_page.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFFF2D6AB);
    const Color darkBrown = Color(0xFF332014);
    const Color headerBrown = Color(0xFF704D31);
    const Color greenAccent = Color(0xFF2E5A1C);

    return Scaffold(
      backgroundColor: bgColor,
      drawer: const AppDrawer(currentPage: 'Dashboard'),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top Bar (Drawer Button & Profile Avatar)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, color: darkBrown, size: 28),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
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
                      radius: 16,
                      backgroundColor: Color(0xFFE2BE8D),
                      child: Text(
                        'A',
                        style: TextStyle(
                          color: darkBrown,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Brand Logo & Name
              Column(
                children: [
                  Icon(
                    Icons.local_cafe_rounded,
                    size: 42,
                    color: greenAccent.withOpacity(0.85),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'TeaMart',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: greenAccent,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const Text(
                    'FINEST TEA COLLECTION',
                    style: TextStyle(
                      fontSize: 8.5,
                      letterSpacing: 1.2,
                      color: darkBrown,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),

              // Overview Header & Revenue
              const Text(
                'Dashboard Overview',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: darkBrown,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                '23 Apr, 2024  10:30 PM',
                style: TextStyle(
                  fontSize: 11,
                  color: darkBrown.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                "Today's Revenue",
                style: TextStyle(
                  fontSize: 13,
                  color: darkBrown,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                '₹18,750.00',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w800,
                  color: darkBrown,
                ),
              ),
              const SizedBox(height: 18),

              // Metrics Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Total Orders',
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    color: darkBrown,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              _buildMetricRow(
                avatarBg: const Color(0xFFE2BE8D),
                icon: Icons.shopping_bag_rounded,
                iconColor: const Color(0xFF634123),
                title: '1,240',
                subtitle: '+21% this week',
                subColor: const Color(0xFF2E6930),
              ),
              const SizedBox(height: 12),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 38,
                    child: Center(
                      child: Icon(
                        Icons.eco,
                        color: Color(0xFF2E6930),
                        size: 24,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Low Stock Items',
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold,
                          color: darkBrown,
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '15 items ',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFF2E6930),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: 'Alert',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFFD32F2F),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),

              _buildMetricRow(
                avatarBg: const Color(0xFFE2BE8D),
                icon: Icons.person,
                iconColor: const Color(0xFF634123),
                title: '88',
                subtitle: '+5% this week',
                subColor: const Color(0xFF2E6930),
              ),
              const SizedBox(height: 22),

              // Recent Orders Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent Orders',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: darkBrown,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Container(
                      color: headerBrown,
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 8,
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text('Order ID', style: _headerStyle),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text('Customer', style: _headerStyle),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text('Date', style: _headerStyle),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text('Status', style: _headerStyle),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Total',
                              textAlign: TextAlign.right,
                              style: _headerStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildTableRow(
                      '#1001',
                      'Customer',
                      '21/07/23',
                      'Pending',
                      '₹500',
                      const Color(0xFF1976D2),
                    ),
                    _buildTableRow(
                      '#1002',
                      'Rishi',
                      '21/07/23',
                      'Shipped',
                      '₹1,117',
                      const Color(0xFF2E7D32),
                    ),
                    _buildTableRow(
                      '#1003',
                      'John',
                      '21/07/23',
                      'Shipped',
                      '₹2,727',
                      const Color(0xFF2E7D32),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              // View All Button
              SizedBox(
                height: 32,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: headerBrown,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'View All',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }

  static const TextStyle _headerStyle = TextStyle(
    color: Colors.white,
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );

  static Widget _buildMetricRow({
    required Color avatarBg,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required Color subColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 19,
          backgroundColor: avatarBg,
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.bold,
                color: Color(0xFF332014),
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 10.5,
                color: subColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget _buildTableRow(
    String id,
    String customer,
    String date,
    String status,
    String total,
    Color statusColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              id,
              style: const TextStyle(fontSize: 9.5, color: Colors.black87),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              customer,
              style: const TextStyle(fontSize: 9.5, color: Colors.black87),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              date,
              style: const TextStyle(fontSize: 9.5, color: Colors.black87),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              status,
              style: TextStyle(
                fontSize: 9.5,
                color: statusColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              total,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 9.5,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

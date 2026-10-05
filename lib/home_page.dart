import 'package:flutter/material.dart';
import 'shop_page.dart';
import 'order_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<Map<String, String>> _heroBanners = [
    {
      'title': 'Elegance In\nEvery Bloom.',
      'subtitle': 'Premium flower teas for your soul.',
      'image': 'assets/home1.png',
    },
    {
      'title': 'The Purest\nBlends.',
      'subtitle': 'Sourced from the finest gardens.',
      'image': 'assets/home2.png',
    },
    {
      'title': 'Find Your\nPerfect Brew.',
      'subtitle': 'Freshly prepared tea for you.',
      'image': 'assets/home3.png',
    },
  ];

  final List<Map<String, String>> _categories = [
    {'title': 'Gourmet Coffee', 'image': 'assets/ec1.png'},
    {'title': 'Premium Tea', 'image': 'assets/ec2.png'},
    {'title': 'Organic Green', 'image': 'assets/ec3.png'},
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _openPage(int index) {
    if (index == 0) return;

    Widget page;

    switch (index) {
      case 1:
        page = const ShopPage();
        break;
      case 2:
        page = const OrderPage();
        break;
      case 3:
        page = const ProfilePage();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4DCB4),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Welcome, [User Name]!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C1E14),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // HERO
              SizedBox(
                height: 160,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _heroBanners.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final banner = _heroBanners[index];

                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                banner['image']!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: const Color(0xFF8C5C38),
                                    child: const Center(
                                      child: Icon(
                                        Icons.image_not_supported,
                                        size: 40,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.65),
                                      Colors.transparent,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                              ),
                            ),

                            Positioned.fill(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        banner['title']!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          height: 1.2,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        banner['subtitle']!,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              // DOTS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_heroBanners.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: _currentPage == index ? 18 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? const Color(0xFF332019)
                          : Colors.brown.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              const Text(
                'Explore Categories',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C1E14),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final category = _categories[index];

                    return _categoryCard(
                      category['title']!,
                      category['image']!,
                    );
                  },
                ),
              ),

              const SizedBox(height: 22),

              const Text(
                'Top Rated Brews',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C1E14),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 215,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _brewCard(
                      'Vanilla Latte',
                      '₹ 150',
                      '4.8',
                      'assets/rb1.png',
                    ),
                    _brewCard('Chai Latte', '₹ 130', '4.7', 'assets/rb2.png'),
                    _brewCard('Green Tea', '₹ 110', '4.9', 'assets/rb3.png'),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 14),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home_outlined, Icons.home, 'Home', 0),
          _navItem(Icons.shopping_bag_outlined, Icons.shopping_bag, 'Shop', 1),
          _navItem(
            Icons.receipt_long_outlined,
            Icons.receipt_long,
            'My Orders',
            2,
          ),
          _navItem(Icons.person_outline, Icons.person, 'Profile', 3),
        ],
      ),
    );
  }

  Widget _navItem(
    IconData icon,
    IconData selectedIcon,
    String label,
    int index,
  ) {
    const selectedColor = Color(0xFF332019);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _openPage(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              index == 0 ? selectedIcon : icon,
              color: index == 0 ? selectedColor : Colors.grey.shade500,
              size: 21,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: index == 0 ? selectedColor : Colors.grey.shade500,
                fontSize: 10,
                fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryCard(String title, String imagePath) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFCDB69B),
                    child: const Icon(
                      Icons.local_cafe,
                      color: Color(0xFF4A2E2B),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2C1E14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _brewCard(String name, String price, String rating, String imagePath) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 100,
                  color: const Color(0xFFE8DCCB),
                  child: const Icon(Icons.coffee, color: Color(0xFF6B4226)),
                );
              },
            ),
          ),

          const SizedBox(height: 8),

          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C1E14),
            ),
          ),

          const SizedBox(height: 2),

          Row(
            children: [
              ...List.generate(
                4,
                (index) =>
                    const Icon(Icons.star, size: 11, color: Colors.amber),
              ),
              const Icon(Icons.star_half, size: 11, color: Colors.amber),
              const SizedBox(width: 4),
              Text(
                rating,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),

          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C1E14),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF332019),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

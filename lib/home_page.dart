import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  // ============================================================
  // HERO BANNERS
  // ============================================================

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

  // ============================================================
  // CATEGORIES DATA
  // ============================================================

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,

        // ======================================================
        // BACKGROUND IMAGE
        // ======================================================
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),

        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =================================================
                // WELCOME
                // =================================================
                const Text(
                  'Welcome, Sujal!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C2415),
                  ),
                ),

                const SizedBox(height: 12),

                // =================================================
                // HERO SLIDER
                // =================================================
                SizedBox(
                  height: 150,
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

                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
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
                                      color: const Color(0xFFD9C3A5),
                                      child: const Center(
                                        child: Icon(
                                          Icons.image_not_supported,
                                          size: 40,
                                          color: Colors.white,
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
                                        Colors.black.withOpacity(0.75),
                                        Colors.black.withOpacity(0.15),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          banner['title']!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Serif',
                                            height: 1.1,
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

                const SizedBox(height: 8),

                // =================================================
                // SLIDER DOTS
                // =================================================
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_heroBanners.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      height: 5,
                      width: _currentPage == index ? 18 : 5,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? const Color(0xFF4A2E2B)
                            : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 18),

                // =================================================
                // EXPLORE CATEGORIES (HORIZONTAL SLIDER)
                // =================================================
                const Text(
                  'Explore Categories',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C2415),
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      final category = _categories[index];
                      return _newCategoryCard(
                        category['title']!,
                        category['image']!,
                      );
                    },
                  ),
                ),

                const SizedBox(height: 18),

                // =================================================
                // TOP RATED BREWS
                // =================================================
                const Text(
                  'Top Rated Brews',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C2415),
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  height: 175,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _brewCard(
                        'Vanilla Tea',
                        '₹ 150',
                        '4.8',
                        'assets/rb1.png',
                      ),
                      _brewCard(
                        'Chai Latte',
                        '₹ 130',
                        '4.7',
                        'assets/rb2.png',
                      ),
                      _brewCard(
                        'Green Tea',
                        '₹ 110',
                        '4.9',
                        'assets/rb3.png',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // CATEGORY CARD (UPDATED ACCORDING TO DESIGN)
  // ============================================================

  Widget _newCategoryCard(String title, String imagePath) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          // Image Section
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFE8DCCB),
                    child: const Center(
                      child: Icon(
                        Icons.local_cafe,
                        color: Color(0xFF6B4226),
                        size: 30,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Label Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3C2415),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BREW CARD
  // ============================================================

  Widget _brewCard(String name, String price, String rating, String imagePath) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.94),
        borderRadius: BorderRadius.circular(12),
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
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: 75,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 75,
                  width: double.infinity,
                  color: const Color(0xFFE8DCCB),
                  child: const Icon(Icons.local_cafe, color: Color(0xFF6B4226)),
                );
              },
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3C2415),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              const Icon(Icons.star, size: 12, color: Colors.amber),
              Text(
                ' $rating',
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
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C2415),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFF4A2E2B),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.add, size: 12, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddProductsPage extends StatelessWidget {
  const AddProductsPage({super.key});

  static const Color bgColor = Color(0xFFF2D6AB);
  static const Color darkBrown = Color(0xFF4A2E18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: darkBrown,
                      size: 22,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Add New Product',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: darkBrown,
                    ),
                  ),
                  const CircleAvatar(
                    radius: 12,
                    backgroundColor: Color(0xFFE2BE8D),
                    child: Text(
                      'A',
                      style: TextStyle(
                        color: darkBrown,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Product Name'),
                    _buildInputField('e.g., Earl Grey Reserve'),
                    const SizedBox(height: 12),
                    _buildLabel('Category'),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAF6F0),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Select a category',
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLabel('Price'),
                              _buildInputField('₹ 9.50'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLabel('Quantity'),
                              _buildInputField('1 kg'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildLabel('Product Description'),
                    Container(
                      height: 70,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAF6F0),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const TextField(
                        maxLines: null,
                        style: TextStyle(fontSize: 11),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Describe the flavor profile...',
                          hintStyle: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildLabel('Product Image'),
                    Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAF6F0),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.crop_original,
                            size: 24,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Tap to upload image',
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.add, size: 16, color: Colors.white),
                  label: const Text(
                    'Add Product',
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkBrown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.bold,
          color: darkBrown,
        ),
      ),
    );
  }

  static Widget _buildInputField(String hint) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAF6F0),
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        style: const TextStyle(fontSize: 11),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 11, color: Colors.grey),
        ),
      ),
    );
  }
}

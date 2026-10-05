import 'package:flutter/material.dart';

class EditProductsPage extends StatelessWidget {
  const EditProductsPage({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Edit Product',
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
              const Text(
                'Product Details',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: darkBrown,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Product Name'),
                    _buildInputField('Cappuccino'),
                    const SizedBox(height: 10),
                    _buildLabel('Category'),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAF6F0),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hot Beverages',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black87,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildLabel('Product Description'),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAF6F0),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'Describe the flavor profile...',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildLabel('Product Image'),
                    Container(
                      width: double.infinity,
                      height: 65,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAF6F0),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.crop_original,
                            size: 20,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Tap to upload image',
                            style: TextStyle(fontSize: 9.5, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Inventory & Pricing',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: darkBrown,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel('Price'),
                          _buildInputField('₹4.50'),
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
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 38,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.save_outlined,
                    size: 15,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Save Changes',
                    style: TextStyle(fontSize: 12, color: Colors.white),
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
              const SizedBox(height: 8),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: darkBrown,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
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
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: darkBrown,
        ),
      ),
    );
  }

  static Widget _buildInputField(String val) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAF6F0),
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        initialValue: val,
        style: const TextStyle(fontSize: 11),
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}

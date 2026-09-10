import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final TextEditingController _addressController = TextEditingController(
    text: '102, Blossom Heights, Near Garden, Rajkot, Gujarat - 360001',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Address'),
        backgroundColor: const Color(0xFF4A2E2B),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Delivery Address',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3C2415),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _addressController,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter full address',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A2E2B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Address Updated Successfully'),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  'Update Address',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

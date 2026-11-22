import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // 1. Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint('=========================================');
    debugPrint('SUCCESS: Firebase connected successfully!');

    // 2. Test Firestore connection by reading the 'Register' collection
    final snapshot = await FirebaseFirestore.instance
        .collection('Register')
        .get();
    debugPrint(
      'SUCCESS: Firestore connected! Documents found: ${snapshot.docs.length}',
    );

    for (var doc in snapshot.docs) {
      debugPrint('Document ID: ${doc.id} => Data: ${doc.data()}');
    }
    debugPrint('=========================================');
  } catch (e) {
    debugPrint('=========================================');
    debugPrint('ERROR: Firebase connection failed: $e');
    debugPrint('=========================================');
  }

  runApp(const TeaMartApp());
}

class TeaMartApp extends StatelessWidget {
  const TeaMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TeaMart',
      home: SplashScreen(),
    );
  }
}

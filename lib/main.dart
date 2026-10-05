import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const TeaMartApp());
}

class TeaMartApp extends StatelessWidget {
  const TeaMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'TeaMart',

      theme: ThemeData(
        useMaterial3: true,

        scaffoldBackgroundColor: const Color(0xFFF1D7B0),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4A2E2B),
          brightness: Brightness.light,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          foregroundColor: Color(0xFF2C1608),
        ),
      ),

      // App પહેલા Splash Screen ખોલશે
      home: const SplashScreen(),
    );
  }
}

<<<<<<< Updated upstream
import 'package:flutter/material.dart';
=======
>>>>>>> Stashed changes
import 'package:flutter_test/flutter_test.dart';
import 'package:teamart_application/main.dart';

void main() {
<<<<<<< Updated upstream
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
=======
  testWidgets('TeaMart Splash Screen test', (WidgetTester tester) async {
    await tester.pumpWidget(const TeaMartApp());

    // Check that TeaMart app is loaded
    expect(find.byType(TeaMartApp), findsOneWidget);

    // Wait for splash screen
    await tester.pump(const Duration(seconds: 1));

    // Splash screen should still be visible
    //expect(find.byType(SplashScreen), findsOneWidget);
>>>>>>> Stashed changes
  });
}
// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teamart_application/main.dart';

void main() {
  testWidgets('Admin Login page rendering test', (WidgetTester tester) async {
    await tester.pumpWidget(const TeaMartAdminApp());

    expect(find.text('Admin Login'), findsOneWidget);
    expect(find.text('Email Address'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login in to your Mart'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
  });

  testWidgets('Navigates to Registration page on tapping Register', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TeaMartAdminApp());

    // Tap the Register text button
    await tester.tap(find.text('Register'));
    await tester.pumpAndSettle();

    // Verify registration screen elements are displayed
    expect(find.text('Admin Registration'), findsOneWidget);
    expect(find.text('Full name'), findsOneWidget);
    expect(find.text('Pincode'), findsOneWidget);
  });
}

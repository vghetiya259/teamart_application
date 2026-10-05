import 'package:flutter_test/flutter_test.dart';
import 'package:teamart_application/main.dart';

void main() {
  testWidgets('TeaMart App test', (WidgetTester tester) async {
    await tester.pumpWidget(const TeaMartApp());

    // Check that TeaMart app is loaded
    expect(find.byType(TeaMartApp), findsOneWidget);

    // Wait for splash screen
    await tester.pump(const Duration(seconds: 1));

    // Check that TeaMart app is still running
    expect(find.byType(TeaMartApp), findsOneWidget);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:teamart_application/main.dart';

void main() {
  testWidgets('TeaMart App Screen test', (WidgetTester tester) async {

    await tester.pumpWidget(const CoffeeApp());

   
    expect(find.byType(CoffeeApp), findsOneWidget);

    await tester.pump(const Duration(seconds: 1));
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:teamart_application/main.dart';

void main() {
  testWidgets('TeaMart App Screen test', (WidgetTester tester) async {
    // App રન કરો (જો main.dart માં ક્લાસનું નામ CoffeeApp હોય તો CoffeeApp() લખવું)
    await tester.pumpWidget(const CoffeeApp());

    // App લોડ થઈ છે કે નહીં તે ચેક કરો
    expect(find.byType(CoffeeApp), findsOneWidget);

    // 1 સેકન્ડ વેટ કરીને ફ્રેમ રિકોલ કરો
    await tester.pump(const Duration(seconds: 1));
  });
}

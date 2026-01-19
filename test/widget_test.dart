import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sm_reward_app/main.dart';

void main() {
  testWidgets('App launches without crashing', (WidgetTester tester) async {
    // Build the app (mobile mode)
    await tester.pumpWidget(const MyApp(isMobile: true, isLoggedIn: true,));

    // Let all frames settle
    await tester.pumpAndSettle();

    // Verify that GetMaterialApp / MaterialApp exists
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}

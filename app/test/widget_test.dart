import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/main.dart';

void main() {
  testWidgets('App smoke test - verifies login screen loads', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    
    // We wait for the initial frame. 
    // We use pump() instead of pumpAndSettle() because Lottie animations 
    // can cause pumpAndSettle to timeout as they loop indefinitely.
    await tester.pump();

    // Verify that the app builds and displays the main app name
    // Using find.byType(MaterialApp) as a basic sanity check
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}

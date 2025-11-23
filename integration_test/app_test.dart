import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ecoride/main.dart' as app;
import 'package:ecoride/core/widgets/inputs/premium_text_field.dart';
import 'package:ecoride/core/widgets/buttons/primary_button.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('login and navigate to map and wallet', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Login Flow
      // Find email field
      final emailFinder = find.widgetWithText(PremiumTextField, 'Email');
      expect(emailFinder, findsOneWidget);
      await tester.enterText(emailFinder, 'test@example.com');
      await tester.pumpAndSettle();

      // Find password field
      final passwordFinder = find.widgetWithText(PremiumTextField, 'Password');
      expect(passwordFinder, findsOneWidget);
      await tester.enterText(passwordFinder, 'password123');
      await tester.pumpAndSettle();

      // Tap Login
      final loginButton = find.widgetWithText(PrimaryButton, 'Sign In');
      expect(loginButton, findsOneWidget);
      await tester.tap(loginButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify Map Screen (Home)
      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.byIcon(Icons.qr_code_scanner), findsOneWidget);

      // Open Drawer
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      // Navigate to Wallet
      final walletItem = find.text('Wallet');
      expect(walletItem, findsOneWidget);
      await tester.tap(walletItem);
      await tester.pumpAndSettle();

      // Verify Wallet Screen
      expect(find.text('EcoRide Cash'), findsOneWidget);
      
      // Go back
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
    });
  });
}

import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:carousel/main.dart' as app;

import 'package:carousel/views/gallery.dart';
import 'package:carousel/views/login.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/foundation.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login', (WidgetTester tester) async {
    
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 1));
    
    final Finder usernameField = find.byKey(const Key('username'));
    expect(usernameField, findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.enterText(find.byKey(const Key('username')), 'testusername');
    expect(find.text('testusername'), findsOneWidget);
    
    final Finder passwordField = find.byKey(const Key('password'));
    expect(passwordField, findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.enterText(find.byKey(const Key('password')), 'testpassword');
    expect(find.text('testusername'), findsOneWidget);
    
    await tester.pumpAndSettle(const Duration(seconds: 1));
    final Finder loginBtn = find.byKey(const Key('LoginButton'));
    await tester.tap(loginBtn);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.byType(Gallery), findsOneWidget);
    expect(find.byType(Swiper), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 2));
    final Finder logoutBtn = find.byKey(const Key('LogoutButton'));
    await tester.tap(logoutBtn);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.byType(Login), findsOneWidget);

  });
}
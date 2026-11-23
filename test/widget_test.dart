import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umeed/app/app.dart';
import 'package:umeed/core/locale_controller.dart';

Future<Widget> _app(Map<String, Object> prefs) async {
  SharedPreferences.setMockInitialValues(prefs);
  final p = await SharedPreferences.getInstance();
  return ProviderScope(
    overrides: [sharedPrefsProvider.overrideWithValue(p)],
    child: const UmeedApp(),
  );
}

void main() {
  testWidgets('help-now opens the crisis screen from Today', (tester) async {
    await tester.pumpWidget(await _app({}));
    await tester.pumpAndSettle();

    expect(find.text('I need help now'), findsOneWidget);
    await tester.tap(find.text('I need help now'));
    await tester.pumpAndSettle();

    expect(find.text('You are not alone'), findsOneWidget);
  });

  testWidgets('Urdu locale renders right-to-left', (tester) async {
    await tester.pumpWidget(await _app({'locale': 'ur'}));
    await tester.pumpAndSettle();

    expect(find.text('مجھے ابھی مدد چاہیے'), findsOneWidget);
    final dir = Directionality.of(tester.element(find.text('مجھے ابھی مدد چاہیے')));
    expect(dir, TextDirection.rtl);
  });

  testWidgets('check-in saves and Today reflects it', (tester) async {
    await tester.pumpWidget(await _app({}));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Check in'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Tired'));
    await tester.pump();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Thank you for checking in'), findsOneWidget);

    await tester.tap(find.text('Today').last);
    await tester.pumpAndSettle();
    expect(find.textContaining('Tired'), findsOneWidget);
  });
}

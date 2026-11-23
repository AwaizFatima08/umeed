import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umeed/app/app.dart';
import 'package:umeed/core/locale_controller.dart';
import 'package:umeed/features/calm/breathing_patterns.dart';

Future<Widget> _app() async {
  SharedPreferences.setMockInitialValues({});
  final p = await SharedPreferences.getInstance();
  return ProviderScope(
    overrides: [sharedPrefsProvider.overrideWithValue(p)],
    child: const UmeedApp(),
  );
}

Future<void> _openCalmTab(WidgetTester tester) async {
  await tester.tap(find.text('Calm').last);
  await tester.pumpAndSettle();
}

Future<void> _tapVisible(WidgetTester tester, String label) async {
  await tester.tap(find.text(label));
  await tester.pumpAndSettle();
}

/// A tall surface so the whole Calm list is on screen without scrolling.
void _tallScreen(WidgetTester tester) {
  tester.view.physicalSize = const Size(800, 2600);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

void main() {
  testWidgets('crisis screen offers WhatsApp guidance and no helpline number', (tester) async {
    await tester.pumpWidget(await _app());
    await tester.pumpAndSettle();
    await tester.tap(find.text('I need help now'));
    await tester.pumpAndSettle();

    expect(find.text('Open WhatsApp'), findsOneWidget);
    expect(find.text('0314 0790080'), findsOneWidget);
    expect(find.textContaining('Umang'), findsNothing);
    expect(find.textContaining('not an emergency service'), findsOneWidget);
  });

  testWidgets('distress check: a safety answer leads to the support message', (tester) async {
    await tester.pumpWidget(await _app());
    await tester.pumpAndSettle();
    await tester.tap(find.text('Distress check').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Begin'));
    await tester.pumpAndSettle();
    for (var i = 0; i < 4; i++) {
      await tester.tap(find.text('Not at all'));
      await tester.pumpAndSettle();
    }
    expect(find.textContaining('One more question'), findsOneWidget);
    await tester.tap(find.text('Several days'));
    await tester.pumpAndSettle();

    expect(find.text('What you shared matters'), findsOneWidget);
    expect(find.text('Get support now'), findsOneWidget);
  });

  testWidgets('distress check: low answers show the coping result', (tester) async {
    await tester.pumpWidget(await _app());
    await tester.pumpAndSettle();
    await tester.tap(find.text('Distress check').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Begin'));
    await tester.pumpAndSettle();
    for (var i = 0; i < 5; i++) {
      await tester.tap(find.text('Not at all'));
      await tester.pumpAndSettle();
    }
    expect(find.text('You seem to be coping right now'), findsOneWidget);
  });

  testWidgets('grounding exercise runs from intro to the end', (tester) async {
    _tallScreen(tester);
    await tester.pumpWidget(await _app());
    await tester.pumpAndSettle();
    await _openCalmTab(tester);
    await _tapVisible(tester, '5-4-3-2-1 grounding');

    await tester.tap(find.text('Begin'));
    await tester.pumpAndSettle();
    for (var i = 0; i < 4; i++) {
      expect(find.text('Step ${i + 1} of 5'), findsOneWidget);
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();
    }
    await tester.tap(find.text('Done'));
    await tester.pumpAndSettle();
    expect(find.text('Well done for taking this time.'), findsOneWidget);
  });

  testWidgets('breathing session shows the phase label for a chosen pattern', (tester) async {
    _tallScreen(tester);
    await tester.pumpWidget(await _app());
    await tester.pumpAndSettle();
    await _openCalmTab(tester);
    await _tapVisible(tester, 'Box breathing');

    await tester.tap(find.text('Start'));
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Breathe in'), findsOneWidget);
    await tester.pump(const Duration(seconds: 5));
    expect(find.text('Hold'), findsOneWidget);

    await tester.tap(find.text('Stop'));
    await tester.pumpWidget(const SizedBox());
  });

  test('every breathing pattern builds contiguous segments', () {
    for (final p in breathingPatterns) {
      final segs = buildSegments(p);
      expect(segs.first.start, 0);
      expect(segs.last.end, p.cycleSeconds);
      for (var i = 1; i < segs.length; i++) {
        expect(segs[i].start, segs[i - 1].end);
        expect(segs[i].from, segs[i - 1].to);
      }
      expect(segs.last.to, lessThan(segs.first.to + 0.001 + 1));
    }
  });
}

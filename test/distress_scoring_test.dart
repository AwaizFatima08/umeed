import 'package:flutter_test/flutter_test.dart';
import 'package:umeed/features/distress/distress_scoring.dart';

void main() {
  group('scoreDistress', () {
    test('low answers are okay', () {
      final r = scoreDistress(items: [0, 1, 0, 1], safety: 0);
      expect(r.level, DistressLevel.okay);
      expect(r.worryFlag, isFalse);
      expect(r.moodFlag, isFalse);
    });

    test('total 3-5 is some strain', () {
      expect(scoreDistress(items: [1, 1, 1, 0], safety: 0).level, DistressLevel.some);
      expect(scoreDistress(items: [2, 1, 1, 1], safety: 0).level, DistressLevel.some);
    });

    test('total 6 or more means talk to someone', () {
      expect(scoreDistress(items: [2, 1, 2, 1], safety: 0).level, DistressLevel.talkSoon);
      expect(scoreDistress(items: [3, 3, 3, 3], safety: 0).level, DistressLevel.talkSoon);
    });

    test('any safety answer is urgent, whatever the total', () {
      expect(scoreDistress(items: [0, 0, 0, 0], safety: 1).level, DistressLevel.urgent);
      expect(scoreDistress(items: [3, 3, 3, 3], safety: 3).level, DistressLevel.urgent);
    });

    test('area flags use the two-item subscales at 3 or more', () {
      final r = scoreDistress(items: [2, 1, 0, 1], safety: 0);
      expect(r.worryFlag, isTrue);
      expect(r.moodFlag, isFalse);
      final m = scoreDistress(items: [0, 0, 2, 1], safety: 0);
      expect(m.worryFlag, isFalse);
      expect(m.moodFlag, isTrue);
    });

    test('rejects malformed input', () {
      expect(() => scoreDistress(items: [0, 0, 0], safety: 0), throwsArgumentError);
      expect(() => scoreDistress(items: [0, 0, 0, 4], safety: 0), throwsArgumentError);
      expect(() => scoreDistress(items: [0, 0, 0, 0], safety: -1), throwsArgumentError);
    });
  });
}

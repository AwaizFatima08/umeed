/// Scoring for the short distress check.
///
/// Items 1-4 follow the PHQ-4 (two anxiety items, two low-mood items), each
/// answered 0-3. A separate safety item (PHQ-9 item 9 wording) is NOT part of
/// the total: any answer above 0 is urgent.
///
/// DRAFT: cut-offs and the three-way outcome are pending clinical sign-off
/// (docs/DESIGN.md §3.3, §6.3). Change them here only, and keep the tests.
enum DistressLevel { okay, some, talkSoon, urgent }

class DistressResult {
  const DistressResult({
    required this.level,
    required this.worryFlag,
    required this.moodFlag,
  });

  final DistressLevel level;

  /// Anxiety items (1+2) at or above 3.
  final bool worryFlag;

  /// Low-mood items (3+4) at or above 3.
  final bool moodFlag;
}

const distressItemCount = 4;

DistressResult scoreDistress({required List<int> items, required int safety}) {
  if (items.length != distressItemCount) {
    throw ArgumentError.value(items, 'items', 'expected $distressItemCount answers');
  }
  if (items.any((v) => v < 0 || v > 3) || safety < 0 || safety > 3) {
    throw ArgumentError('answers must be between 0 and 3');
  }
  final total = items.fold<int>(0, (a, b) => a + b);
  final level = safety > 0
      ? DistressLevel.urgent
      : total >= 6
          ? DistressLevel.talkSoon
          : total >= 3
              ? DistressLevel.some
              : DistressLevel.okay;
  return DistressResult(
    level: level,
    worryFlag: items[0] + items[1] >= 3,
    moodFlag: items[2] + items[3] >= 3,
  );
}

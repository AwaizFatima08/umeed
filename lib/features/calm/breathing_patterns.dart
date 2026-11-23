import '../../l10n/app_localizations.dart';

enum BreathPhase { inhale, sip, hold, exhale }

class BreathStep {
  const BreathStep(this.phase, this.seconds);

  final BreathPhase phase;
  final int seconds;
}

class BreathingPattern {
  const BreathingPattern(this.id, this.steps);

  final String id;
  final List<BreathStep> steps;

  int get cycleSeconds => steps.fold(0, (a, s) => a + s.seconds);

  String name(AppLocalizations l) => switch (id) {
        'slow' => l.breathSlowName,
        'box' => l.breathBoxName,
        '478' => l.breath478Name,
        'even' => l.breathEvenName,
        'sigh' => l.breathSighName,
        _ => l.breathGentleName,
      };

  String description(AppLocalizations l) => switch (id) {
        'slow' => l.breathSlowDesc,
        'box' => l.breathBoxDesc,
        '478' => l.breath478Desc,
        'even' => l.breathEvenDesc,
        'sigh' => l.breathSighDesc,
        _ => l.breathGentleDesc,
      };
}

const breathingPatterns = <BreathingPattern>[
  BreathingPattern('slow', [BreathStep(BreathPhase.inhale, 4), BreathStep(BreathPhase.exhale, 6)]),
  BreathingPattern('box', [
    BreathStep(BreathPhase.inhale, 4),
    BreathStep(BreathPhase.hold, 4),
    BreathStep(BreathPhase.exhale, 4),
    BreathStep(BreathPhase.hold, 4),
  ]),
  BreathingPattern('478', [
    BreathStep(BreathPhase.inhale, 4),
    BreathStep(BreathPhase.hold, 7),
    BreathStep(BreathPhase.exhale, 8),
  ]),
  BreathingPattern('even', [BreathStep(BreathPhase.inhale, 5), BreathStep(BreathPhase.exhale, 5)]),
  BreathingPattern('sigh', [
    BreathStep(BreathPhase.inhale, 3),
    BreathStep(BreathPhase.sip, 1),
    BreathStep(BreathPhase.exhale, 6),
  ]),
  BreathingPattern('gentle', [BreathStep(BreathPhase.inhale, 2), BreathStep(BreathPhase.exhale, 4)]),
];

BreathingPattern breathingPatternById(String id) =>
    breathingPatterns.firstWhere((p) => p.id == id, orElse: () => breathingPatterns.first);

/// One timed segment of the animation with the circle scale at each end.
class BreathSegment {
  const BreathSegment(this.phase, this.start, this.end, this.from, this.to);

  final BreathPhase phase;
  final double start;
  final double end;
  final double from;
  final double to;
}

const _low = 0.55;
const _high = 1.0;

/// Builds segments for one cycle. A "sip" is a second small inhale on top of
/// the first, so the first inhale only reaches 85% of full.
List<BreathSegment> buildSegments(BreathingPattern p) {
  final hasSip = p.steps.any((s) => s.phase == BreathPhase.sip);
  final segments = <BreathSegment>[];
  var t = 0.0;
  var level = _low;
  for (final s in p.steps) {
    final end = t + s.seconds;
    final target = switch (s.phase) {
      BreathPhase.inhale => hasSip ? _low + (_high - _low) * 0.75 : _high,
      BreathPhase.sip => _high,
      BreathPhase.hold => level,
      BreathPhase.exhale => _low,
    };
    segments.add(BreathSegment(s.phase, t, end, level, target));
    level = target;
    t = end;
  }
  return segments;
}

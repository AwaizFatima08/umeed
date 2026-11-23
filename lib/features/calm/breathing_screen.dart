import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../crisis/help_now_button.dart';
import 'breathing_patterns.dart';

/// Guided breathing for any [BreathingPattern].
class BreathingScreen extends StatefulWidget {
  const BreathingScreen({super.key, required this.patternId});

  final String patternId;

  @override
  State<BreathingScreen> createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen>
    with SingleTickerProviderStateMixin {
  late final BreathingPattern _pattern = breathingPatternById(widget.patternId);
  late final List<BreathSegment> _segments = buildSegments(_pattern);
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: _pattern.cycleSeconds),
  );
  bool _running = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _running = !_running);
    if (_running) {
      _controller.repeat();
    } else {
      _controller.stop();
      _controller.value = 0;
    }
  }

  BreathSegment _segmentAt(double seconds) => _segments.firstWhere(
        (s) => seconds < s.end,
        orElse: () => _segments.last,
      );

  String _label(AppLocalizations l, BreathPhase p) => switch (p) {
        BreathPhase.inhale => l.breatheIn,
        BreathPhase.sip => l.breatheSip,
        BreathPhase.hold => l.breathHold,
        BreathPhase.exhale => l.breatheOut,
      };

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(_pattern.name(l)),
        actions: const [HelpNowButton(), SizedBox(width: 12)],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    final seconds = _controller.value * _pattern.cycleSeconds;
                    final seg = _segmentAt(seconds);
                    final p = ((seconds - seg.start) / (seg.end - seg.start)).clamp(0.0, 1.0);
                    final scale = seg.from + (seg.to - seg.from) * Curves.easeInOut.transform(p);
                    final remaining = math.max(1, (seg.end - seconds).ceil());
                    final size = 250 * scale;
                    return Container(
                      width: size,
                      height: size,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: scheme.primaryContainer),
                      alignment: Alignment.center,
                      child: !_running
                          ? const SizedBox.shrink()
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _label(l, seg.phase),
                                  textAlign: TextAlign.center,
                                  style: text.titleMedium,
                                ),
                                Text('$remaining', style: text.headlineMedium),
                              ],
                            ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                l.breathHint,
                textAlign: TextAlign.center,
                style: text.bodySmall,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(onPressed: _toggle, child: Text(_running ? l.stop : l.start)),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

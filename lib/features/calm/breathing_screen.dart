import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../crisis/help_now_button.dart';

/// Paced breathing, 4 s in and 6 s out.
class BreathingScreen extends StatefulWidget {
  const BreathingScreen({super.key});

  @override
  State<BreathingScreen> createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen>
    with SingleTickerProviderStateMixin {
  static const _inFraction = 0.4;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
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
      _controller.animateTo(0, duration: const Duration(milliseconds: 600));
    }
  }

  double _scale(double t) {
    final p = t < _inFraction ? t / _inFraction : 1 - (t - _inFraction) / (1 - _inFraction);
    return 0.55 + 0.45 * Curves.easeInOut.transform(p);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(l.breathingTitle),
        actions: const [HelpNowButton(), SizedBox(width: 12)],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                final t = _controller.value;
                final label = !_running
                    ? ''
                    : (t < _inFraction ? l.breatheIn : l.breatheOut);
                return Container(
                  width: 240 * _scale(t),
                  height: 240 * _scale(t),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: scheme.primaryContainer,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            FilledButton(
              onPressed: _toggle,
              child: Text(_running ? l.stop : l.start),
            ),
          ],
        ),
      ),
    );
  }
}

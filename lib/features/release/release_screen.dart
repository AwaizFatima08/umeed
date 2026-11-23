import 'package:flutter/material.dart';

import '../../app/theme.dart';
import '../../l10n/app_localizations.dart';

/// Write it down, then let it go. Nothing is stored.
class ReleaseScreen extends StatefulWidget {
  const ReleaseScreen({super.key});

  @override
  State<ReleaseScreen> createState() => _ReleaseScreenState();
}

class _ReleaseScreenState extends State<ReleaseScreen> {
  final _controller = TextEditingController();
  bool _fading = false;
  bool _released = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _release() async {
    if (_controller.text.trim().isEmpty) return;
    setState(() => _fading = true);
    await Future<void>.delayed(const Duration(milliseconds: 1600));
    if (!mounted) return;
    _controller.clear();
    setState(() {
      _fading = false;
      _released = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    if (_released) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l.released,
              textAlign: TextAlign.center,
              style: contentStyle(context, text.titleLarge),
            ),
            const SizedBox(height: 24),
            OutlinedButton(
              onPressed: () => setState(() => _released = false),
              child: Text(l.writeAnother),
            ),
          ],
        ),
      );
    }
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(l.releaseHint, style: contentStyle(context, text.titleMedium)),
        const SizedBox(height: 16),
        AnimatedOpacity(
          opacity: _fading ? 0 : 1,
          duration: const Duration(milliseconds: 1500),
          child: TextField(
            controller: _controller,
            enabled: !_fading,
            minLines: 8,
            maxLines: 14,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: _fading ? null : _release,
          child: Text(l.release),
        ),
      ],
    );
  }
}

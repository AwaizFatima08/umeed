import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';
import '../crisis/help_now_button.dart';
import 'checkin_model.dart';

class CheckInScreen extends ConsumerStatefulWidget {
  const CheckInScreen({super.key});

  @override
  ConsumerState<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends ConsumerState<CheckInScreen> {
  Feeling? _feeling;
  double _energy = 0.5;
  final _note = TextEditingController();
  bool _saved = false;

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  void _save() {
    final feeling = _feeling;
    if (feeling == null) return;
    final note = _note.text.trim();
    ref.read(checkInsProvider.notifier).add(CheckIn(
          at: DateTime.now(),
          feeling: feeling,
          energy: _energy,
          note: note.isEmpty ? null : note,
        ));
    setState(() => _saved = true);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(l.checkInTitle),
        actions: const [HelpNowButton(), SizedBox(width: 12)],
      ),
      body: _saved
          ? Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite, size: 48, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(height: 16),
                  Text(l.checkInSaved, textAlign: TextAlign.center, style: text.titleMedium),
                  const SizedBox(height: 24),
                  FilledButton(onPressed: () => context.pop(), child: Text(l.navToday)),
                ],
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final f in Feeling.values)
                      ChoiceChip(
                        label: Text(feelingLabel(l, f)),
                        selected: _feeling == f,
                        onSelected: (_) => setState(() => _feeling = f),
                      ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(l.energyLabel, style: text.titleSmall),
                Slider(value: _energy, onChanged: (v) => setState(() => _energy = v)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(l.energyLow), Text(l.energyHigh)],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _note,
                  minLines: 3,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: l.noteHint,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: _feeling == null ? null : _save,
                  child: Text(l.save),
                ),
              ],
            ),
    );
  }
}

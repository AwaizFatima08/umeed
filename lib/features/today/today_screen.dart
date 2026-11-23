import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../l10n/app_localizations.dart';
import '../checkin/checkin_model.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    final checkIns = ref.watch(checkInsProvider);
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(l.todayPrompt, style: contentStyle(context, text.headlineSmall)),
        const SizedBox(height: 16),
        if (checkIns.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              l.lastFelt(feelingLabel(l, checkIns.last.feeling)),
              style: contentStyle(context, text.bodyMedium),
            ),
          ),
        FilledButton.icon(
          onPressed: () => context.push('/checkin'),
          icon: const Icon(Icons.check_circle_outline),
          label: Text(l.checkInCta),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () => context.push('/distress'),
          icon: const Icon(Icons.fact_check_outlined),
          label: Text(l.distressTitle),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () => context.push('/breathing/slow'),
          icon: const Icon(Icons.air),
          label: Text(l.calmCta),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () => context.go('/release'),
          icon: const Icon(Icons.edit_note),
          label: Text(l.releaseCta),
        ),
        const SizedBox(height: 32),
        Text(l.disclaimer, style: text.bodySmall),
      ],
    );
  }
}

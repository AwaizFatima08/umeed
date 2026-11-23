import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../l10n/app_localizations.dart';
import '../exercises/exercise_model.dart';
import 'breathing_patterns.dart';

class CalmScreen extends StatelessWidget {
  const CalmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final exercises = buildExercises(l);
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(l.calmIntro, style: contentStyle(context, text.titleMedium)),
        const SizedBox(height: 16),
        Card(
          color: scheme.tertiaryContainer,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            leading: const Icon(Icons.fact_check_outlined),
            title: Text(l.distressTitle),
            subtitle: Text(l.distressSub),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/distress'),
          ),
        ),
        const SizedBox(height: 24),
        Text(l.breathingPatterns, style: text.titleSmall),
        const SizedBox(height: 8),
        for (final p in breathingPatterns) ...[
          Card(
            color: scheme.secondaryContainer,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              leading: const Icon(Icons.air),
              title: Text(p.name(l)),
              subtitle: Text(p.description(l)),
              onTap: () => context.push('/breathing/${p.id}'),
            ),
          ),
          const SizedBox(height: 8),
        ],
        const SizedBox(height: 16),
        Text(l.exercisesTitle, style: text.titleSmall),
        const SizedBox(height: 8),
        for (final e in exercises) ...[
          Card(
            color: scheme.surfaceContainerHighest,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              leading: Icon(e.icon),
              title: Text(e.title),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/exercise/${e.id}'),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}

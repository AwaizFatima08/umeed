import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../l10n/app_localizations.dart';

class CalmScreen extends StatelessWidget {
  const CalmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(l.calmIntro, style: contentStyle(context, text.titleMedium)),
        const SizedBox(height: 20),
        Card(
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            leading: const Icon(Icons.air),
            title: Text(l.breathingTitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/breathing'),
          ),
        ),
      ],
    );
  }
}

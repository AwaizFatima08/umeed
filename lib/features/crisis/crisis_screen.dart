import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/theme.dart';
import '../../l10n/app_localizations.dart';
import 'helplines.dart';

class CrisisScreen extends StatelessWidget {
  const CrisisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(l.crisisTitle)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(l.crisisBody, style: contentStyle(context, text.titleMedium)),
          const SizedBox(height: 24),
          Text(l.helplines, style: text.titleSmall),
          const SizedBox(height: 8),
          for (final h in helplines)
            Card(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: ListTile(
                title: Text(h.name),
                subtitle: Text('${h.country} · ${h.number}'),
                trailing: FilledButton.icon(
                  onPressed: () =>
                      launchUrl(Uri(scheme: 'tel', path: h.number)),
                  icon: const Icon(Icons.call, size: 18),
                  label: Text(l.callNow),
                ),
              ),
            ),
          const SizedBox(height: 8),
          Text(l.findHelpline, style: contentStyle(context, text.bodyMedium)),
          const SizedBox(height: 8),
          Text(
            l.helplineUnverified,
            style: text.bodySmall?.copyWith(color: Theme.of(context).colorScheme.error),
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: () => context.push('/breathing'),
            icon: const Icon(Icons.air),
            label: Text(l.groundingCta),
          ),
        ],
      ),
    );
  }
}

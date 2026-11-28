import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../l10n/app_localizations.dart';
import 'contacts.dart';
import 'open_link.dart';

class CrisisScreen extends StatelessWidget {
  const CrisisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(l.crisisTitle)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(l.crisisBody, style: contentStyle(context, text.titleMedium)),
          const SizedBox(height: 24),
          Card(
            color: scheme.surfaceContainerHighest,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l.guidanceTitle, style: text.titleMedium),
                  const SizedBox(height: 8),
                  Text(l.guidanceBody, style: contentStyle(context, text.bodyMedium)),
                  const SizedBox(height: 4),
                  Text(
                    supportEmail,
                    textDirection: TextDirection.ltr,
                    style: text.titleSmall,
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: () => openLink(context, supportEmailUri()),
                    icon: const Icon(Icons.mail_outline, size: 18),
                    label: Text(l.emailUs),
                  ),
                  const SizedBox(height: 8),
                  Text(l.guidancePrivacy, style: text.bodySmall),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: () => context.push('/breathing/slow'),
            icon: const Icon(Icons.air),
            label: Text(l.groundingCta),
          ),
        ],
      ),
    );
  }
}

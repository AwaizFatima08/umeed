import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../core/locale_controller.dart';
import '../../l10n/app_localizations.dart';

class MeScreen extends ConsumerWidget {
  const MeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    final locale = ref.watch(localeProvider);
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(l.language, style: text.titleSmall),
        const SizedBox(height: 8),
        SegmentedButton<String>(
          segments: [
            ButtonSegment(value: 'en', label: Text(l.english)),
            ButtonSegment(value: 'ur', label: Text(l.urdu)),
          ],
          selected: {locale.languageCode},
          onSelectionChanged: (s) =>
              ref.read(localeProvider.notifier).setLocale(Locale(s.first)),
        ),
        const SizedBox(height: 32),
        Text(l.about, style: text.titleSmall),
        const SizedBox(height: 8),
        Text(l.aboutBody, style: contentStyle(context, text.bodyMedium)),
        const SizedBox(height: 16),
        Text(l.disclaimer, style: contentStyle(context, text.bodySmall)),
        const SizedBox(height: 24),
        Text(l.debugBuild, style: text.bodySmall?.copyWith(color: Theme.of(context).colorScheme.error)),
      ],
    );
  }
}

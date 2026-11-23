import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';

/// Always-visible route to the Crisis screen.
class HelpNowButton extends StatelessWidget {
  const HelpNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return FilledButton.icon(
      onPressed: () => context.push('/crisis'),
      icon: const Icon(Icons.favorite_border, size: 18),
      label: Text(AppLocalizations.of(context).helpNow),
      style: FilledButton.styleFrom(
        backgroundColor: scheme.tertiaryContainer,
        foregroundColor: scheme.onTertiaryContainer,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}

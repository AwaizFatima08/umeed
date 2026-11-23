import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/crisis/help_now_button.dart';
import '../l10n/app_localizations.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l.appName),
        actions: const [HelpNowButton(), SizedBox(width: 12)],
      ),
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: (i) =>
            shell.goBranch(i, initialLocation: i == shell.currentIndex),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.wb_twilight_outlined), selectedIcon: const Icon(Icons.wb_twilight), label: l.navToday),
          NavigationDestination(icon: const Icon(Icons.air_outlined), selectedIcon: const Icon(Icons.air), label: l.navCalm),
          NavigationDestination(icon: const Icon(Icons.edit_note_outlined), selectedIcon: const Icon(Icons.edit_note), label: l.navRelease),
          NavigationDestination(icon: const Icon(Icons.person_outline), selectedIcon: const Icon(Icons.person), label: l.navMe),
        ],
      ),
    );
  }
}

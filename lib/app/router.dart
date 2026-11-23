import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/calm/breathing_screen.dart';
import '../features/calm/calm_screen.dart';
import '../features/checkin/checkin_screen.dart';
import '../features/crisis/crisis_screen.dart';
import '../features/distress/distress_screen.dart';
import '../features/exercises/exercise_screen.dart';
import '../features/release/release_screen.dart';
import '../features/settings/me_screen.dart';
import '../features/today/today_screen.dart';
import 'shell.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/today',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => AppShell(shell: shell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(path: '/today', builder: (context, state) => const TodayScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/calm', builder: (context, state) => const CalmScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/release', builder: (context, state) => const ReleaseScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/me', builder: (context, state) => const MeScreen()),
          ]),
        ],
      ),
      GoRoute(path: '/checkin', builder: (context, state) => const CheckInScreen()),
      GoRoute(
        path: '/breathing/:id',
        builder: (context, state) =>
            BreathingScreen(patternId: state.pathParameters['id'] ?? 'slow'),
      ),
      GoRoute(
        path: '/exercise/:id',
        builder: (context, state) =>
            ExerciseScreen(exerciseId: state.pathParameters['id'] ?? ''),
      ),
      GoRoute(path: '/distress', builder: (context, state) => const DistressScreen()),
      GoRoute(path: '/crisis', builder: (context, state) => const CrisisScreen()),
    ],
  );
});

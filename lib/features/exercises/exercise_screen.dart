import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../l10n/app_localizations.dart';
import '../crisis/help_now_button.dart';
import 'exercise_model.dart';

/// Runs any [Exercise]: intro, then steps one at a time, then a closing screen.
/// Typed answers stay in memory for the session only.
class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key, required this.exerciseId});

  final String exerciseId;

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  /// -1 = intro, 0..n-1 = steps, n = finished.
  int _index = -1;
  final Map<int, TextEditingController> _inputs = {};
  final Map<int, int> _picked = {};

  @override
  void dispose() {
    for (final c in _inputs.values) {
      c.dispose();
    }
    super.dispose();
  }

  TextEditingController _input(int i) => _inputs.putIfAbsent(i, TextEditingController.new);

  void _next() => setState(() => _index++);

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    final exercise = buildExercises(l).firstWhere(
      (e) => e.id == widget.exerciseId,
      orElse: () => buildExercises(l).first,
    );
    final total = exercise.steps.length;

    Widget body;
    if (_index < 0) {
      body = _Page(
        content: [
          Icon(exercise.icon, size: 40, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 16),
          Text(exercise.intro, style: contentStyle(context, text.titleMedium)),
        ],
        action: FilledButton(onPressed: _next, child: Text(l.exStart)),
      );
    } else if (_index >= total) {
      final echoIndex = exercise.echoStep;
      final echo = echoIndex == null ? '' : _input(echoIndex).text.trim();
      body = _Page(
        content: [
          Icon(Icons.favorite, size: 40, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 16),
          Text(l.exFinished, style: contentStyle(context, text.titleLarge)),
          if (echo.isNotEmpty) ...[
            const SizedBox(height: 24),
            Text(exercise.echoLabel ?? '', style: text.titleSmall),
            const SizedBox(height: 8),
            Text(echo, style: contentStyle(context, text.titleMedium)),
          ],
        ],
        action: FilledButton(onPressed: () => context.pop(), child: Text(l.exDone)),
      );
    } else {
      final step = exercise.steps[_index];
      final canContinue = step.kind != StepKind.choice || _picked.containsKey(_index);
      body = _Page(
        header: Text(l.exStepOf(_index + 1, total), style: text.labelLarge),
        content: [
          Text(step.text, style: contentStyle(context, text.titleMedium)),
          const SizedBox(height: 24),
          switch (step.kind) {
            StepKind.read => const SizedBox.shrink(),
            StepKind.timed => _Countdown(key: ValueKey(_index), seconds: step.seconds),
            StepKind.input => TextField(
                controller: _input(_index),
                minLines: 3,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: l.exInputHint,
                  border: const OutlineInputBorder(),
                ),
              ),
            StepKind.choice => Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (var c = 0; c < step.choices.length; c++)
                    ChoiceChip(
                      label: Text(step.choices[c]),
                      selected: _picked[_index] == c,
                      onSelected: (_) => setState(() => _picked[_index] = c),
                    ),
                ],
              ),
          },
        ],
        action: FilledButton(
          onPressed: canContinue ? _next : null,
          child: Text(_index == total - 1 ? l.exDone : l.exNext),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.title),
        actions: const [HelpNowButton(), SizedBox(width: 12)],
      ),
      body: body,
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({required this.content, required this.action, this.header});

  final Widget? header;
  final List<Widget> content;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [if (header != null) ...[header!, const SizedBox(height: 12)], ...content],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: SizedBox(width: double.infinity, child: action),
          ),
        ],
      ),
    );
  }
}

class _Countdown extends StatefulWidget {
  const _Countdown({super.key, required this.seconds});

  final int seconds;

  @override
  State<_Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<_Countdown> {
  late int _left = widget.seconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_left <= 1) {
        t.cancel();
      }
      if (mounted) setState(() => _left = _left > 0 ? _left - 1 : 0);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: CircularProgressIndicator(
              value: 1 - _left / widget.seconds,
              strokeWidth: 8,
              backgroundColor: scheme.primaryContainer,
            ),
          ),
          Text('$_left', style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),
    );
  }
}

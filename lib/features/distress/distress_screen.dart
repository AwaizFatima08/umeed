import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../l10n/app_localizations.dart';
import '../crisis/help_now_button.dart';
import '../crisis/contacts.dart';
import '../crisis/open_link.dart';
import 'distress_scoring.dart';

/// Short guided distress check. Answers are held in memory only.
class DistressScreen extends StatefulWidget {
  const DistressScreen({super.key});

  @override
  State<DistressScreen> createState() => _DistressScreenState();
}

class _DistressScreenState extends State<DistressScreen> {
  static const _questionCount = distressItemCount + 1; // last one is the safety item

  /// -1 = intro, 0..4 = questions, 5 = result.
  int _index = -1;
  final List<int?> _answers = List.filled(_questionCount, null);

  void _answer(int value) => setState(() {
        _answers[_index] = value;
        _index++;
      });

  void _restart() => setState(() {
        _answers.fillRange(0, _questionCount, null);
        _index = -1;
      });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l.distressTitle),
        actions: const [HelpNowButton(), SizedBox(width: 12)],
      ),
      body: SafeArea(
        child: _index < 0
            ? _intro(l)
            : _index < _questionCount
                ? _question(l)
                : _result(l),
      ),
    );
  }

  Widget _intro(AppLocalizations l) {
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [Text(l.distressIntro, style: contentStyle(context, text.titleMedium))],
            ),
          ),
          FilledButton(onPressed: () => setState(() => _index = 0), child: Text(l.exStart)),
        ],
      ),
    );
  }

  Widget _question(AppLocalizations l) {
    final text = Theme.of(context).textTheme;
    final prompts = [l.distressQ1, l.distressQ2, l.distressQ3, l.distressQ4, l.distressQSafety];
    final options = [l.distressOpt0, l.distressOpt1, l.distressOpt2, l.distressOpt3];
    final isSafety = _index == _questionCount - 1;
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(l.exStepOf(_index + 1, _questionCount), style: text.labelLarge),
        const SizedBox(height: 12),
        if (isSafety) ...[
          Text(l.distressSafetyIntro, style: contentStyle(context, text.titleSmall)),
          const SizedBox(height: 8),
        ],
        Text(prompts[_index], style: contentStyle(context, text.titleLarge)),
        const SizedBox(height: 24),
        for (var v = 0; v < options.length; v++) ...[
          OutlinedButton(
            onPressed: () => _answer(v),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(52),
              backgroundColor: _answers[_index] == v
                  ? Theme.of(context).colorScheme.primaryContainer
                  : null,
            ),
            child: Text(options[v]),
          ),
          const SizedBox(height: 10),
        ],
        if (_index > 0)
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextButton.icon(
              onPressed: () => setState(() => _index--),
              icon: const Icon(Icons.arrow_back, size: 18),
              label: Text(MaterialLocalizations.of(context).backButtonTooltip),
            ),
          ),
      ],
    );
  }

  Widget _result(AppLocalizations l) {
    final text = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final result = scoreDistress(
      items: [for (var i = 0; i < distressItemCount; i++) _answers[i] ?? 0],
      safety: _answers[_questionCount - 1] ?? 0,
    );
    final (title, body) = switch (result.level) {
      DistressLevel.okay => (l.distressOkayTitle, l.distressOkayBody),
      DistressLevel.some => (l.distressSomeTitle, l.distressSomeBody),
      DistressLevel.talkSoon => (l.distressTalkTitle, l.distressTalkBody),
      DistressLevel.urgent => (l.distressUrgentTitle, l.distressUrgentBody),
    };
    final urgent = result.level == DistressLevel.urgent;
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(title, style: contentStyle(context, text.headlineSmall)),
        const SizedBox(height: 12),
        Text(body, style: contentStyle(context, text.bodyLarge)),
        if (!urgent && (result.worryFlag || result.moodFlag)) ...[
          const SizedBox(height: 16),
          if (result.worryFlag) Text('• ${l.distressAreaWorry}', style: contentStyle(context, text.bodyMedium)),
          if (result.moodFlag) Text('• ${l.distressAreaMood}', style: contentStyle(context, text.bodyMedium)),
        ],
        const SizedBox(height: 24),
        if (urgent)
          FilledButton(onPressed: () => context.push('/crisis'), child: Text(l.distressUrgentCta))
        else ...[
          if (result.level == DistressLevel.talkSoon) ...[
            FilledButton.icon(
              onPressed: () => openLink(context, supportEmailUri()),
              icon: const Icon(Icons.mail_outline, size: 18),
              label: Text(l.distressTalkCta),
            ),
            const SizedBox(height: 10),
            Text(l.guidancePrivacy, style: text.bodySmall),
            const SizedBox(height: 16),
          ],
          OutlinedButton(onPressed: () => context.go('/calm'), child: Text(l.distressTryCta)),
        ],
        const SizedBox(height: 10),
        TextButton(onPressed: _restart, child: Text(l.distressRetake)),
        const SizedBox(height: 24),
        Text(l.distressNote, style: contentStyle(context, text.bodySmall)),
        const SizedBox(height: 8),
        Text(l.distressDraft, style: text.bodySmall?.copyWith(color: scheme.error)),
      ],
    );
  }
}

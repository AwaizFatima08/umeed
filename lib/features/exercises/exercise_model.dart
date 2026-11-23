import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

enum StepKind { read, timed, input, choice }

class ExStep {
  const ExStep.read(this.text)
      : kind = StepKind.read,
        seconds = 0,
        choices = const [];
  const ExStep.timed(this.text, this.seconds)
      : kind = StepKind.timed,
        choices = const [];
  const ExStep.input(this.text)
      : kind = StepKind.input,
        seconds = 0,
        choices = const [];
  const ExStep.choice(this.text, this.choices)
      : kind = StepKind.choice,
        seconds = 0;

  final StepKind kind;
  final String text;
  final int seconds;
  final List<String> choices;
}

class Exercise {
  const Exercise({
    required this.id,
    required this.icon,
    required this.title,
    required this.intro,
    required this.steps,
    this.echoStep,
    this.echoLabel,
  });

  final String id;
  final IconData icon;
  final String title;
  final String intro;
  final List<ExStep> steps;

  /// Index of an input step whose answer is shown again at the end.
  final int? echoStep;
  final String? echoLabel;
}

/// Exercises are data: text comes from the ARB files, structure from here.
List<Exercise> buildExercises(AppLocalizations l) => [
      Exercise(
        id: 'grounding',
        icon: Icons.visibility_outlined,
        title: l.exGroundingTitle,
        intro: l.exGroundingIntro,
        steps: [
          ExStep.read(l.exGrounding1),
          ExStep.read(l.exGrounding2),
          ExStep.read(l.exGrounding3),
          ExStep.read(l.exGrounding4),
          ExStep.read(l.exGrounding5),
        ],
      ),
      Exercise(
        id: 'pmr',
        icon: Icons.self_improvement,
        title: l.exPmrTitle,
        intro: l.exPmrIntro,
        steps: [
          ExStep.timed(l.exPmr1, 15),
          ExStep.timed(l.exPmr2, 15),
          ExStep.timed(l.exPmr3, 15),
          ExStep.timed(l.exPmr4, 15),
          ExStep.timed(l.exPmr5, 15),
          ExStep.timed(l.exPmr6, 15),
        ],
      ),
      Exercise(
        id: 'bodyscan',
        icon: Icons.accessibility_new,
        title: l.exScanTitle,
        intro: l.exScanIntro,
        steps: [
          ExStep.timed(l.exScan1, 20),
          ExStep.timed(l.exScan2, 20),
          ExStep.timed(l.exScan3, 20),
          ExStep.timed(l.exScan4, 20),
          ExStep.timed(l.exScan5, 20),
        ],
      ),
      Exercise(
        id: 'hug',
        icon: Icons.volunteer_activism_outlined,
        title: l.exHugTitle,
        intro: l.exHugIntro,
        steps: [ExStep.timed(l.exHug1, 60)],
      ),
      Exercise(
        id: 'goodthings',
        icon: Icons.wb_sunny_outlined,
        title: l.exGoodTitle,
        intro: l.exGoodIntro,
        steps: [
          ExStep.input(l.exGood1),
          ExStep.input(l.exGood2),
          ExStep.input(l.exGood3),
        ],
      ),
      Exercise(
        id: 'untangle',
        icon: Icons.psychology_alt_outlined,
        title: l.exUntangleTitle,
        intro: l.exUntangleIntro,
        steps: [
          ExStep.input(l.exUntangle1),
          ExStep.input(l.exUntangle2),
          ExStep.choice(l.exUntangle3, [
            l.trapAllNothing,
            l.trapWorst,
            l.trapMind,
            l.trapBlame,
            l.trapShould,
            l.trapGood,
          ]),
          ExStep.input(l.exUntangle4),
        ],
        echoStep: 3,
        echoLabel: l.exUntangleEnd,
      ),
      Exercise(
        id: 'tinystep',
        icon: Icons.directions_walk,
        title: l.exTinyTitle,
        intro: l.exTinyIntro,
        steps: [
          ExStep.choice(l.exTiny1, [
            l.tinyWater,
            l.tinyAir,
            l.tinyFace,
            l.tinyStretch,
            l.tinyText,
            l.tinyLight,
            l.tinyEat,
          ]),
          ExStep.read(l.exTiny2),
        ],
      ),
    ];

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/app_localizations.dart';

enum Feeling { calm, okay, tired, anxious, sad, numb, angry, overwhelmed, hopeful }

String feelingLabel(AppLocalizations l, Feeling f) => switch (f) {
      Feeling.calm => l.feelingCalm,
      Feeling.okay => l.feelingOkay,
      Feeling.tired => l.feelingTired,
      Feeling.anxious => l.feelingAnxious,
      Feeling.sad => l.feelingSad,
      Feeling.numb => l.feelingNumb,
      Feeling.angry => l.feelingAngry,
      Feeling.overwhelmed => l.feelingOverwhelmed,
      Feeling.hopeful => l.feelingHopeful,
    };

class CheckIn {
  const CheckIn({required this.at, required this.feeling, required this.energy, this.note});

  final DateTime at;
  final Feeling feeling;
  final double energy;
  final String? note;
}

/// In-memory only for the debug build. Replaced by encrypted Drift storage.
class CheckInsController extends Notifier<List<CheckIn>> {
  @override
  List<CheckIn> build() => const [];

  void add(CheckIn c) => state = [...state, c];
}

final checkInsProvider =
    NotifierProvider<CheckInsController, List<CheckIn>>(CheckInsController.new);

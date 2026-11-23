// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Umeed';

  @override
  String get navToday => 'Today';

  @override
  String get navCalm => 'Calm';

  @override
  String get navRelease => 'Release';

  @override
  String get navMe => 'Me';

  @override
  String get helpNow => 'I need help now';

  @override
  String get todayPrompt => 'Take a moment. How are you today?';

  @override
  String lastFelt(String feeling) {
    return 'Last time you said you felt $feeling.';
  }

  @override
  String get checkInCta => 'Check in';

  @override
  String get calmCta => 'Slow breathing';

  @override
  String get releaseCta => 'Write and release';

  @override
  String get disclaimer =>
      'Umeed is self-help and guidance. It is not medical advice or an emergency service.';

  @override
  String get feelingCalm => 'Calm';

  @override
  String get feelingOkay => 'Okay';

  @override
  String get feelingTired => 'Tired';

  @override
  String get feelingAnxious => 'Anxious';

  @override
  String get feelingSad => 'Sad';

  @override
  String get feelingNumb => 'Numb';

  @override
  String get feelingAngry => 'Angry';

  @override
  String get feelingOverwhelmed => 'Overwhelmed';

  @override
  String get feelingHopeful => 'Hopeful';

  @override
  String get checkInTitle => 'How are you feeling?';

  @override
  String get energyLabel => 'Energy';

  @override
  String get energyLow => 'Low';

  @override
  String get energyHigh => 'High';

  @override
  String get noteHint => 'Anything you want to put down? (optional)';

  @override
  String get save => 'Save';

  @override
  String get checkInSaved =>
      'Thank you for checking in. That took effort, and it counts.';

  @override
  String get calmTitle => 'Calm';

  @override
  String get calmIntro => 'A few slow breaths can help your body settle.';

  @override
  String get breathingTitle => 'Slow breathing';

  @override
  String get breatheIn => 'Breathe in';

  @override
  String get breatheOut => 'Breathe out';

  @override
  String get start => 'Start';

  @override
  String get stop => 'Stop';

  @override
  String get releaseTitle => 'Write and release';

  @override
  String get releaseHint =>
      'Write what is weighing on you. It will not be saved.';

  @override
  String get release => 'Release';

  @override
  String get released => 'Let it go. It is gone, and you are still here.';

  @override
  String get writeAnother => 'Write again';

  @override
  String get crisisTitle => 'You are not alone';

  @override
  String get crisisBody =>
      'This moment can pass. If you may be in danger, please call your local emergency number now.';

  @override
  String get helplines => 'Helplines';

  @override
  String get helplineUnverified =>
      'DEBUG: helpline numbers are not yet clinically verified.';

  @override
  String get findHelpline =>
      'Not in this list? Search for a helpline in your country at findahelpline.com.';

  @override
  String get callNow => 'Call';

  @override
  String get groundingCta => 'Try a minute of slow breathing';

  @override
  String get meTitle => 'Me';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get urdu => 'اردو';

  @override
  String get about => 'About';

  @override
  String get aboutBody =>
      'Umeed is a private companion for stress, worry and low mood. Everything stays on this phone.';

  @override
  String get debugBuild => 'Debug build. Not for release.';
}

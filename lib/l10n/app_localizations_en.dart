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
  String get findHelpline =>
      'Not in this list? Search for a helpline in your country at findahelpline.com.';

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

  @override
  String get guidanceTitle => 'Talk to someone for guidance';

  @override
  String get guidanceBody =>
      'Message us on WhatsApp for guidance. This is not an emergency service.';

  @override
  String get guidancePrivacy =>
      'Your WhatsApp number will be visible to the person who replies.';

  @override
  String get openWhatsApp => 'Open WhatsApp';

  @override
  String get whatsappFailed => 'Could not open WhatsApp.';

  @override
  String get breathingPatterns => 'Breathing patterns';

  @override
  String get exercisesTitle => 'Exercises';

  @override
  String get breathHint => 'If you feel dizzy, stop and breathe normally.';

  @override
  String get breathHold => 'Hold';

  @override
  String get breatheSip => 'Sip in a little more';

  @override
  String get breathSlowName => 'Slow breathing';

  @override
  String get breathSlowDesc => 'In for 4, out for 6. A simple way to settle.';

  @override
  String get breathBoxName => 'Box breathing';

  @override
  String get breathBoxDesc =>
      'In 4, hold 4, out 4, hold 4. Steadies a racing mind.';

  @override
  String get breath478Name => '4-7-8 breathing';

  @override
  String get breath478Desc => 'In 4, hold 7, out 8. Helpful at bedtime.';

  @override
  String get breathEvenName => 'Even breathing';

  @override
  String get breathEvenDesc => 'In 5, out 5. A calm, steady rhythm.';

  @override
  String get breathSighName => 'Calming sigh';

  @override
  String get breathSighDesc =>
      'Two quick breaths in, one long breath out. Quick relief.';

  @override
  String get breathGentleName => 'Gentle breathing';

  @override
  String get breathGentleDesc =>
      'In 2, out 4. Easiest when you feel breathless or panicky.';

  @override
  String get exStart => 'Begin';

  @override
  String get exNext => 'Next';

  @override
  String get exDone => 'Done';

  @override
  String get exFinished => 'Well done for taking this time.';

  @override
  String get exInputHint => 'Write here';

  @override
  String exMinutesHint(int minutes) {
    return 'About $minutes min';
  }

  @override
  String get exGroundingTitle => '5-4-3-2-1 grounding';

  @override
  String get exGroundingIntro =>
      'Brings your attention back to the here and now. Good for racing thoughts or panic.';

  @override
  String get exGrounding1 => 'Look around slowly. Name 5 things you can see.';

  @override
  String get exGrounding2 =>
      'Notice 4 things you can feel: your feet on the floor, your clothes, the seat beneath you.';

  @override
  String get exGrounding3 => 'Listen. Name 3 sounds, near or far.';

  @override
  String get exGrounding4 =>
      'Find 2 things you can smell, or think of 2 smells you like.';

  @override
  String get exGrounding5 =>
      'Notice 1 thing you can taste, or take one slow sip of water.';

  @override
  String get exPmrTitle => 'Muscle relaxation';

  @override
  String get exPmrIntro =>
      'Tense each part for a few seconds, then let go. This teaches your body what relaxed feels like. Skip any part that hurts.';

  @override
  String get exPmr1 =>
      'Hands. Squeeze your fists for 5 seconds, then let them go loose and notice the difference.';

  @override
  String get exPmr2 =>
      'Arms. Bend your elbows and tense your arms for 5 seconds, then let them drop.';

  @override
  String get exPmr3 =>
      'Shoulders. Lift them up to your ears for 5 seconds, then let them fall.';

  @override
  String get exPmr4 =>
      'Face. Scrunch your face tight for 5 seconds, then soften your forehead, eyes and jaw.';

  @override
  String get exPmr5 =>
      'Stomach. Tighten your belly for 5 seconds, then release and let it be soft.';

  @override
  String get exPmr6 =>
      'Legs and feet. Press your heels down and curl your toes for 5 seconds, then let go.';

  @override
  String get exScanTitle => 'Body scan';

  @override
  String get exScanIntro =>
      'Slowly move your attention through your body, without trying to change anything.';

  @override
  String get exScan1 =>
      'Bring your attention to your feet. Notice whatever is there.';

  @override
  String get exScan2 =>
      'Move up through your legs. Notice any tightness or warmth.';

  @override
  String get exScan3 =>
      'Notice your belly rising and falling with each breath.';

  @override
  String get exScan4 => 'Notice your chest and shoulders. Let them be heavy.';

  @override
  String get exScan5 => 'Notice your jaw, eyes and forehead. Let them soften.';

  @override
  String get exHugTitle => 'Butterfly hug';

  @override
  String get exHugIntro => 'A self-soothing tap that can ease strong feelings.';

  @override
  String get exHug1 =>
      'Cross your arms over your chest, hands resting on your shoulders. Tap slowly, left then right, and breathe slowly.';

  @override
  String get exGoodTitle => 'Three good things';

  @override
  String get exGoodIntro =>
      'Even on hard days, small good moments exist. Noticing them helps balance the mind. Nothing here is saved.';

  @override
  String get exGood1 => 'Something small that went okay today.';

  @override
  String get exGood2 => 'Something or someone you are thankful for.';

  @override
  String get exGood3 => 'Something you managed, even if it was hard.';

  @override
  String get exUntangleTitle => 'Thought untangler';

  @override
  String get exUntangleIntro =>
      'Notice a thought that is weighing on you, and look for a kinder, more balanced way to see it. Nothing here is saved.';

  @override
  String get exUntangle1 => 'What happened? Just the facts.';

  @override
  String get exUntangle2 => 'What thought is going round in your head?';

  @override
  String get exUntangle3 => 'Which thinking trap does it sound like?';

  @override
  String get exUntangle4 =>
      'What would you say to a friend who had this thought?';

  @override
  String get exUntangleEnd => 'Your kinder thought:';

  @override
  String get trapAllNothing => 'All or nothing';

  @override
  String get trapWorst => 'Worst case';

  @override
  String get trapMind => 'Mind reading';

  @override
  String get trapBlame => 'Blaming myself';

  @override
  String get trapShould => 'Shoulds and musts';

  @override
  String get trapGood => 'Ignoring the good';

  @override
  String get exTinyTitle => 'One tiny step';

  @override
  String get exTinyIntro =>
      'On heavy days, small actions help. Pick one, only one.';

  @override
  String get exTiny1 => 'Pick one small thing you can do right now.';

  @override
  String get exTiny2 => 'Do just that. Nothing else is needed right now.';

  @override
  String get tinyWater => 'Drink a glass of water';

  @override
  String get tinyAir => 'Open a window or step outside';

  @override
  String get tinyFace => 'Wash your face';

  @override
  String get tinyStretch => 'Stretch for one minute';

  @override
  String get tinyText => 'Send one person a message';

  @override
  String get tinyLight => 'Sit in the light for two minutes';

  @override
  String get tinyEat => 'Eat something small';

  @override
  String get distressTitle => 'Distress check';

  @override
  String get distressSub => 'A one-minute check on how you have been';

  @override
  String get distressIntro =>
      'Over the last two weeks, how often have you been bothered by each of these? This is a short check for awareness. It is not a diagnosis.';

  @override
  String get distressQ1 => 'Feeling nervous, anxious or on edge';

  @override
  String get distressQ2 => 'Not being able to stop or control worrying';

  @override
  String get distressQ3 => 'Little interest or pleasure in doing things';

  @override
  String get distressQ4 => 'Feeling down, low or hopeless';

  @override
  String get distressSafetyIntro => 'One more question, and it matters.';

  @override
  String get distressQSafety =>
      'Thoughts that you would be better off dead, or of hurting yourself in some way';

  @override
  String get distressOpt0 => 'Not at all';

  @override
  String get distressOpt1 => 'Several days';

  @override
  String get distressOpt2 => 'More than half the days';

  @override
  String get distressOpt3 => 'Nearly every day';

  @override
  String get distressSeeResult => 'See result';

  @override
  String get distressOkayTitle => 'You seem to be coping right now';

  @override
  String get distressOkayBody =>
      'Your answers suggest things feel manageable lately. Keep looking after yourself, and come back any time.';

  @override
  String get distressSomeTitle => 'You have been under some strain';

  @override
  String get distressSomeBody =>
      'Your answers suggest you have been feeling some strain. Small daily practices can help, and it is okay to ask for support.';

  @override
  String get distressTalkTitle => 'It may help to talk to someone';

  @override
  String get distressTalkBody =>
      'Your answers suggest you have been carrying a lot. You do not have to be in crisis to deserve support. Talking to a doctor or counsellor could help.';

  @override
  String get distressUrgentTitle => 'What you shared matters';

  @override
  String get distressUrgentBody =>
      'Thank you for answering honestly. Please reach out for support now. You do not have to face this alone.';

  @override
  String get distressAreaWorry =>
      'Worry and nervousness have been hard to switch off.';

  @override
  String get distressAreaMood =>
      'Low mood or loss of interest has been weighing on you.';

  @override
  String get distressUrgentCta => 'Get support now';

  @override
  String get distressTalkCta => 'Message on WhatsApp';

  @override
  String get distressTryCta => 'Try a calming exercise';

  @override
  String get distressRetake => 'Take it again';

  @override
  String get distressDraft =>
      'DEBUG: wording and cut-offs pending clinical review. Urdu wording not yet validated.';

  @override
  String exStepOf(int n, int total) {
    return 'Step $n of $total';
  }

  @override
  String get distressNote =>
      'This was a short check for awareness. It is not a diagnosis.';
}

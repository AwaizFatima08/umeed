import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ur'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Umeed'**
  String get appName;

  /// No description provided for @navToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get navToday;

  /// No description provided for @navCalm.
  ///
  /// In en, this message translates to:
  /// **'Calm'**
  String get navCalm;

  /// No description provided for @navRelease.
  ///
  /// In en, this message translates to:
  /// **'Release'**
  String get navRelease;

  /// No description provided for @navMe.
  ///
  /// In en, this message translates to:
  /// **'Me'**
  String get navMe;

  /// No description provided for @helpNow.
  ///
  /// In en, this message translates to:
  /// **'I need help now'**
  String get helpNow;

  /// No description provided for @todayPrompt.
  ///
  /// In en, this message translates to:
  /// **'Take a moment. How are you today?'**
  String get todayPrompt;

  /// No description provided for @lastFelt.
  ///
  /// In en, this message translates to:
  /// **'Last time you said you felt {feeling}.'**
  String lastFelt(String feeling);

  /// No description provided for @checkInCta.
  ///
  /// In en, this message translates to:
  /// **'Check in'**
  String get checkInCta;

  /// No description provided for @calmCta.
  ///
  /// In en, this message translates to:
  /// **'Slow breathing'**
  String get calmCta;

  /// No description provided for @releaseCta.
  ///
  /// In en, this message translates to:
  /// **'Write and release'**
  String get releaseCta;

  /// No description provided for @disclaimer.
  ///
  /// In en, this message translates to:
  /// **'Umeed is self-help and guidance. It is not medical advice or an emergency service.'**
  String get disclaimer;

  /// No description provided for @feelingCalm.
  ///
  /// In en, this message translates to:
  /// **'Calm'**
  String get feelingCalm;

  /// No description provided for @feelingOkay.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get feelingOkay;

  /// No description provided for @feelingTired.
  ///
  /// In en, this message translates to:
  /// **'Tired'**
  String get feelingTired;

  /// No description provided for @feelingAnxious.
  ///
  /// In en, this message translates to:
  /// **'Anxious'**
  String get feelingAnxious;

  /// No description provided for @feelingSad.
  ///
  /// In en, this message translates to:
  /// **'Sad'**
  String get feelingSad;

  /// No description provided for @feelingNumb.
  ///
  /// In en, this message translates to:
  /// **'Numb'**
  String get feelingNumb;

  /// No description provided for @feelingAngry.
  ///
  /// In en, this message translates to:
  /// **'Angry'**
  String get feelingAngry;

  /// No description provided for @feelingOverwhelmed.
  ///
  /// In en, this message translates to:
  /// **'Overwhelmed'**
  String get feelingOverwhelmed;

  /// No description provided for @feelingHopeful.
  ///
  /// In en, this message translates to:
  /// **'Hopeful'**
  String get feelingHopeful;

  /// No description provided for @checkInTitle.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling?'**
  String get checkInTitle;

  /// No description provided for @energyLabel.
  ///
  /// In en, this message translates to:
  /// **'Energy'**
  String get energyLabel;

  /// No description provided for @energyLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get energyLow;

  /// No description provided for @energyHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get energyHigh;

  /// No description provided for @noteHint.
  ///
  /// In en, this message translates to:
  /// **'Anything you want to put down? (optional)'**
  String get noteHint;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @checkInSaved.
  ///
  /// In en, this message translates to:
  /// **'Thank you for checking in. That took effort, and it counts.'**
  String get checkInSaved;

  /// No description provided for @calmTitle.
  ///
  /// In en, this message translates to:
  /// **'Calm'**
  String get calmTitle;

  /// No description provided for @calmIntro.
  ///
  /// In en, this message translates to:
  /// **'A few slow breaths can help your body settle.'**
  String get calmIntro;

  /// No description provided for @breathingTitle.
  ///
  /// In en, this message translates to:
  /// **'Slow breathing'**
  String get breathingTitle;

  /// No description provided for @breatheIn.
  ///
  /// In en, this message translates to:
  /// **'Breathe in'**
  String get breatheIn;

  /// No description provided for @breatheOut.
  ///
  /// In en, this message translates to:
  /// **'Breathe out'**
  String get breatheOut;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @stop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// No description provided for @releaseTitle.
  ///
  /// In en, this message translates to:
  /// **'Write and release'**
  String get releaseTitle;

  /// No description provided for @releaseHint.
  ///
  /// In en, this message translates to:
  /// **'Write what is weighing on you. It will not be saved.'**
  String get releaseHint;

  /// No description provided for @release.
  ///
  /// In en, this message translates to:
  /// **'Release'**
  String get release;

  /// No description provided for @released.
  ///
  /// In en, this message translates to:
  /// **'Let it go. It is gone, and you are still here.'**
  String get released;

  /// No description provided for @writeAnother.
  ///
  /// In en, this message translates to:
  /// **'Write again'**
  String get writeAnother;

  /// No description provided for @crisisTitle.
  ///
  /// In en, this message translates to:
  /// **'You are not alone'**
  String get crisisTitle;

  /// No description provided for @crisisBody.
  ///
  /// In en, this message translates to:
  /// **'This moment can pass. If you may be in danger, please call your local emergency number now.'**
  String get crisisBody;

  /// No description provided for @groundingCta.
  ///
  /// In en, this message translates to:
  /// **'Try a minute of slow breathing'**
  String get groundingCta;

  /// No description provided for @meTitle.
  ///
  /// In en, this message translates to:
  /// **'Me'**
  String get meTitle;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @urdu.
  ///
  /// In en, this message translates to:
  /// **'اردو'**
  String get urdu;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @aboutBody.
  ///
  /// In en, this message translates to:
  /// **'Umeed is a private companion for stress, worry and low mood. Everything stays on this phone.'**
  String get aboutBody;

  /// No description provided for @debugBuild.
  ///
  /// In en, this message translates to:
  /// **'Debug build. Not for release.'**
  String get debugBuild;

  /// No description provided for @guidanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Talk to someone for guidance'**
  String get guidanceTitle;

  /// No description provided for @guidanceBody.
  ///
  /// In en, this message translates to:
  /// **'Write to us for guidance. We read every message, but replies are not immediate and this is not an emergency service.'**
  String get guidanceBody;

  /// No description provided for @guidancePrivacy.
  ///
  /// In en, this message translates to:
  /// **'Your email address will be visible to the person who replies. Use an address that does not show your name if you prefer.'**
  String get guidancePrivacy;

  /// No description provided for @emailUs.
  ///
  /// In en, this message translates to:
  /// **'Email us'**
  String get emailUs;

  /// No description provided for @linkFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not open this link.'**
  String get linkFailed;

  /// No description provided for @breathingPatterns.
  ///
  /// In en, this message translates to:
  /// **'Breathing patterns'**
  String get breathingPatterns;

  /// No description provided for @exercisesTitle.
  ///
  /// In en, this message translates to:
  /// **'Exercises'**
  String get exercisesTitle;

  /// No description provided for @breathHint.
  ///
  /// In en, this message translates to:
  /// **'If you feel dizzy, stop and breathe normally.'**
  String get breathHint;

  /// No description provided for @breathHold.
  ///
  /// In en, this message translates to:
  /// **'Hold'**
  String get breathHold;

  /// No description provided for @breatheSip.
  ///
  /// In en, this message translates to:
  /// **'Sip in a little more'**
  String get breatheSip;

  /// No description provided for @breathSlowName.
  ///
  /// In en, this message translates to:
  /// **'Slow breathing'**
  String get breathSlowName;

  /// No description provided for @breathSlowDesc.
  ///
  /// In en, this message translates to:
  /// **'In for 4, out for 6. A simple way to settle.'**
  String get breathSlowDesc;

  /// No description provided for @breathBoxName.
  ///
  /// In en, this message translates to:
  /// **'Box breathing'**
  String get breathBoxName;

  /// No description provided for @breathBoxDesc.
  ///
  /// In en, this message translates to:
  /// **'In 4, hold 4, out 4, hold 4. Steadies a racing mind.'**
  String get breathBoxDesc;

  /// No description provided for @breath478Name.
  ///
  /// In en, this message translates to:
  /// **'4-7-8 breathing'**
  String get breath478Name;

  /// No description provided for @breath478Desc.
  ///
  /// In en, this message translates to:
  /// **'In 4, hold 7, out 8. Helpful at bedtime.'**
  String get breath478Desc;

  /// No description provided for @breathEvenName.
  ///
  /// In en, this message translates to:
  /// **'Even breathing'**
  String get breathEvenName;

  /// No description provided for @breathEvenDesc.
  ///
  /// In en, this message translates to:
  /// **'In 5, out 5. A calm, steady rhythm.'**
  String get breathEvenDesc;

  /// No description provided for @breathSighName.
  ///
  /// In en, this message translates to:
  /// **'Calming sigh'**
  String get breathSighName;

  /// No description provided for @breathSighDesc.
  ///
  /// In en, this message translates to:
  /// **'Two quick breaths in, one long breath out. Quick relief.'**
  String get breathSighDesc;

  /// No description provided for @breathGentleName.
  ///
  /// In en, this message translates to:
  /// **'Gentle breathing'**
  String get breathGentleName;

  /// No description provided for @breathGentleDesc.
  ///
  /// In en, this message translates to:
  /// **'In 2, out 4. Easiest when you feel breathless or panicky.'**
  String get breathGentleDesc;

  /// No description provided for @exStart.
  ///
  /// In en, this message translates to:
  /// **'Begin'**
  String get exStart;

  /// No description provided for @exNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get exNext;

  /// No description provided for @exDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get exDone;

  /// No description provided for @exFinished.
  ///
  /// In en, this message translates to:
  /// **'Well done for taking this time.'**
  String get exFinished;

  /// No description provided for @exInputHint.
  ///
  /// In en, this message translates to:
  /// **'Write here'**
  String get exInputHint;

  /// No description provided for @exMinutesHint.
  ///
  /// In en, this message translates to:
  /// **'About {minutes} min'**
  String exMinutesHint(int minutes);

  /// No description provided for @exGroundingTitle.
  ///
  /// In en, this message translates to:
  /// **'5-4-3-2-1 grounding'**
  String get exGroundingTitle;

  /// No description provided for @exGroundingIntro.
  ///
  /// In en, this message translates to:
  /// **'Brings your attention back to the here and now. Good for racing thoughts or panic.'**
  String get exGroundingIntro;

  /// No description provided for @exGrounding1.
  ///
  /// In en, this message translates to:
  /// **'Look around slowly. Name 5 things you can see.'**
  String get exGrounding1;

  /// No description provided for @exGrounding2.
  ///
  /// In en, this message translates to:
  /// **'Notice 4 things you can feel: your feet on the floor, your clothes, the seat beneath you.'**
  String get exGrounding2;

  /// No description provided for @exGrounding3.
  ///
  /// In en, this message translates to:
  /// **'Listen. Name 3 sounds, near or far.'**
  String get exGrounding3;

  /// No description provided for @exGrounding4.
  ///
  /// In en, this message translates to:
  /// **'Find 2 things you can smell, or think of 2 smells you like.'**
  String get exGrounding4;

  /// No description provided for @exGrounding5.
  ///
  /// In en, this message translates to:
  /// **'Notice 1 thing you can taste, or take one slow sip of water.'**
  String get exGrounding5;

  /// No description provided for @exPmrTitle.
  ///
  /// In en, this message translates to:
  /// **'Muscle relaxation'**
  String get exPmrTitle;

  /// No description provided for @exPmrIntro.
  ///
  /// In en, this message translates to:
  /// **'Tense each part for a few seconds, then let go. This teaches your body what relaxed feels like. Skip any part that hurts.'**
  String get exPmrIntro;

  /// No description provided for @exPmr1.
  ///
  /// In en, this message translates to:
  /// **'Hands. Squeeze your fists for 5 seconds, then let them go loose and notice the difference.'**
  String get exPmr1;

  /// No description provided for @exPmr2.
  ///
  /// In en, this message translates to:
  /// **'Arms. Bend your elbows and tense your arms for 5 seconds, then let them drop.'**
  String get exPmr2;

  /// No description provided for @exPmr3.
  ///
  /// In en, this message translates to:
  /// **'Shoulders. Lift them up to your ears for 5 seconds, then let them fall.'**
  String get exPmr3;

  /// No description provided for @exPmr4.
  ///
  /// In en, this message translates to:
  /// **'Face. Scrunch your face tight for 5 seconds, then soften your forehead, eyes and jaw.'**
  String get exPmr4;

  /// No description provided for @exPmr5.
  ///
  /// In en, this message translates to:
  /// **'Stomach. Tighten your belly for 5 seconds, then release and let it be soft.'**
  String get exPmr5;

  /// No description provided for @exPmr6.
  ///
  /// In en, this message translates to:
  /// **'Legs and feet. Press your heels down and curl your toes for 5 seconds, then let go.'**
  String get exPmr6;

  /// No description provided for @exScanTitle.
  ///
  /// In en, this message translates to:
  /// **'Body scan'**
  String get exScanTitle;

  /// No description provided for @exScanIntro.
  ///
  /// In en, this message translates to:
  /// **'Slowly move your attention through your body, without trying to change anything.'**
  String get exScanIntro;

  /// No description provided for @exScan1.
  ///
  /// In en, this message translates to:
  /// **'Bring your attention to your feet. Notice whatever is there.'**
  String get exScan1;

  /// No description provided for @exScan2.
  ///
  /// In en, this message translates to:
  /// **'Move up through your legs. Notice any tightness or warmth.'**
  String get exScan2;

  /// No description provided for @exScan3.
  ///
  /// In en, this message translates to:
  /// **'Notice your belly rising and falling with each breath.'**
  String get exScan3;

  /// No description provided for @exScan4.
  ///
  /// In en, this message translates to:
  /// **'Notice your chest and shoulders. Let them be heavy.'**
  String get exScan4;

  /// No description provided for @exScan5.
  ///
  /// In en, this message translates to:
  /// **'Notice your jaw, eyes and forehead. Let them soften.'**
  String get exScan5;

  /// No description provided for @exHugTitle.
  ///
  /// In en, this message translates to:
  /// **'Butterfly hug'**
  String get exHugTitle;

  /// No description provided for @exHugIntro.
  ///
  /// In en, this message translates to:
  /// **'A self-soothing tap that can ease strong feelings.'**
  String get exHugIntro;

  /// No description provided for @exHug1.
  ///
  /// In en, this message translates to:
  /// **'Cross your arms over your chest, hands resting on your shoulders. Tap slowly, left then right, and breathe slowly.'**
  String get exHug1;

  /// No description provided for @exGoodTitle.
  ///
  /// In en, this message translates to:
  /// **'Three good things'**
  String get exGoodTitle;

  /// No description provided for @exGoodIntro.
  ///
  /// In en, this message translates to:
  /// **'Even on hard days, small good moments exist. Noticing them helps balance the mind. Nothing here is saved.'**
  String get exGoodIntro;

  /// No description provided for @exGood1.
  ///
  /// In en, this message translates to:
  /// **'Something small that went okay today.'**
  String get exGood1;

  /// No description provided for @exGood2.
  ///
  /// In en, this message translates to:
  /// **'Something or someone you are thankful for.'**
  String get exGood2;

  /// No description provided for @exGood3.
  ///
  /// In en, this message translates to:
  /// **'Something you managed, even if it was hard.'**
  String get exGood3;

  /// No description provided for @exUntangleTitle.
  ///
  /// In en, this message translates to:
  /// **'Thought untangler'**
  String get exUntangleTitle;

  /// No description provided for @exUntangleIntro.
  ///
  /// In en, this message translates to:
  /// **'Notice a thought that is weighing on you, and look for a kinder, more balanced way to see it. Nothing here is saved.'**
  String get exUntangleIntro;

  /// No description provided for @exUntangle1.
  ///
  /// In en, this message translates to:
  /// **'What happened? Just the facts.'**
  String get exUntangle1;

  /// No description provided for @exUntangle2.
  ///
  /// In en, this message translates to:
  /// **'What thought is going round in your head?'**
  String get exUntangle2;

  /// No description provided for @exUntangle3.
  ///
  /// In en, this message translates to:
  /// **'Which thinking trap does it sound like?'**
  String get exUntangle3;

  /// No description provided for @exUntangle4.
  ///
  /// In en, this message translates to:
  /// **'What would you say to a friend who had this thought?'**
  String get exUntangle4;

  /// No description provided for @exUntangleEnd.
  ///
  /// In en, this message translates to:
  /// **'Your kinder thought:'**
  String get exUntangleEnd;

  /// No description provided for @trapAllNothing.
  ///
  /// In en, this message translates to:
  /// **'All or nothing'**
  String get trapAllNothing;

  /// No description provided for @trapWorst.
  ///
  /// In en, this message translates to:
  /// **'Worst case'**
  String get trapWorst;

  /// No description provided for @trapMind.
  ///
  /// In en, this message translates to:
  /// **'Mind reading'**
  String get trapMind;

  /// No description provided for @trapBlame.
  ///
  /// In en, this message translates to:
  /// **'Blaming myself'**
  String get trapBlame;

  /// No description provided for @trapShould.
  ///
  /// In en, this message translates to:
  /// **'Shoulds and musts'**
  String get trapShould;

  /// No description provided for @trapGood.
  ///
  /// In en, this message translates to:
  /// **'Ignoring the good'**
  String get trapGood;

  /// No description provided for @exTinyTitle.
  ///
  /// In en, this message translates to:
  /// **'One tiny step'**
  String get exTinyTitle;

  /// No description provided for @exTinyIntro.
  ///
  /// In en, this message translates to:
  /// **'On heavy days, small actions help. Pick one, only one.'**
  String get exTinyIntro;

  /// No description provided for @exTiny1.
  ///
  /// In en, this message translates to:
  /// **'Pick one small thing you can do right now.'**
  String get exTiny1;

  /// No description provided for @exTiny2.
  ///
  /// In en, this message translates to:
  /// **'Do just that. Nothing else is needed right now.'**
  String get exTiny2;

  /// No description provided for @tinyWater.
  ///
  /// In en, this message translates to:
  /// **'Drink a glass of water'**
  String get tinyWater;

  /// No description provided for @tinyAir.
  ///
  /// In en, this message translates to:
  /// **'Open a window or step outside'**
  String get tinyAir;

  /// No description provided for @tinyFace.
  ///
  /// In en, this message translates to:
  /// **'Wash your face'**
  String get tinyFace;

  /// No description provided for @tinyStretch.
  ///
  /// In en, this message translates to:
  /// **'Stretch for one minute'**
  String get tinyStretch;

  /// No description provided for @tinyText.
  ///
  /// In en, this message translates to:
  /// **'Send one person a message'**
  String get tinyText;

  /// No description provided for @tinyLight.
  ///
  /// In en, this message translates to:
  /// **'Sit in the light for two minutes'**
  String get tinyLight;

  /// No description provided for @tinyEat.
  ///
  /// In en, this message translates to:
  /// **'Eat something small'**
  String get tinyEat;

  /// No description provided for @distressTitle.
  ///
  /// In en, this message translates to:
  /// **'Distress check'**
  String get distressTitle;

  /// No description provided for @distressSub.
  ///
  /// In en, this message translates to:
  /// **'A one-minute check on how you have been'**
  String get distressSub;

  /// No description provided for @distressIntro.
  ///
  /// In en, this message translates to:
  /// **'Over the last two weeks, how often have you been bothered by each of these? This is a short check for awareness. It is not a diagnosis.'**
  String get distressIntro;

  /// No description provided for @distressQ1.
  ///
  /// In en, this message translates to:
  /// **'Feeling nervous, anxious or on edge'**
  String get distressQ1;

  /// No description provided for @distressQ2.
  ///
  /// In en, this message translates to:
  /// **'Not being able to stop or control worrying'**
  String get distressQ2;

  /// No description provided for @distressQ3.
  ///
  /// In en, this message translates to:
  /// **'Little interest or pleasure in doing things'**
  String get distressQ3;

  /// No description provided for @distressQ4.
  ///
  /// In en, this message translates to:
  /// **'Feeling down, low or hopeless'**
  String get distressQ4;

  /// No description provided for @distressSafetyIntro.
  ///
  /// In en, this message translates to:
  /// **'One more question, and it matters.'**
  String get distressSafetyIntro;

  /// No description provided for @distressQSafety.
  ///
  /// In en, this message translates to:
  /// **'Thoughts that you would be better off dead, or of hurting yourself in some way'**
  String get distressQSafety;

  /// No description provided for @distressOpt0.
  ///
  /// In en, this message translates to:
  /// **'Not at all'**
  String get distressOpt0;

  /// No description provided for @distressOpt1.
  ///
  /// In en, this message translates to:
  /// **'Several days'**
  String get distressOpt1;

  /// No description provided for @distressOpt2.
  ///
  /// In en, this message translates to:
  /// **'More than half the days'**
  String get distressOpt2;

  /// No description provided for @distressOpt3.
  ///
  /// In en, this message translates to:
  /// **'Nearly every day'**
  String get distressOpt3;

  /// No description provided for @distressSeeResult.
  ///
  /// In en, this message translates to:
  /// **'See result'**
  String get distressSeeResult;

  /// No description provided for @distressOkayTitle.
  ///
  /// In en, this message translates to:
  /// **'You seem to be coping right now'**
  String get distressOkayTitle;

  /// No description provided for @distressOkayBody.
  ///
  /// In en, this message translates to:
  /// **'Your answers suggest things feel manageable lately. Keep looking after yourself, and come back any time.'**
  String get distressOkayBody;

  /// No description provided for @distressSomeTitle.
  ///
  /// In en, this message translates to:
  /// **'You have been under some strain'**
  String get distressSomeTitle;

  /// No description provided for @distressSomeBody.
  ///
  /// In en, this message translates to:
  /// **'Your answers suggest you have been feeling some strain. Small daily practices can help, and it is okay to ask for support.'**
  String get distressSomeBody;

  /// No description provided for @distressTalkTitle.
  ///
  /// In en, this message translates to:
  /// **'It may help to talk to someone'**
  String get distressTalkTitle;

  /// No description provided for @distressTalkBody.
  ///
  /// In en, this message translates to:
  /// **'Your answers suggest you have been carrying a lot. You do not have to be in crisis to deserve support. Talking to a doctor or counsellor could help.'**
  String get distressTalkBody;

  /// No description provided for @distressUrgentTitle.
  ///
  /// In en, this message translates to:
  /// **'What you shared matters'**
  String get distressUrgentTitle;

  /// No description provided for @distressUrgentBody.
  ///
  /// In en, this message translates to:
  /// **'Thank you for answering honestly. Please reach out for support now. You do not have to face this alone.'**
  String get distressUrgentBody;

  /// No description provided for @distressAreaWorry.
  ///
  /// In en, this message translates to:
  /// **'Worry and nervousness have been hard to switch off.'**
  String get distressAreaWorry;

  /// No description provided for @distressAreaMood.
  ///
  /// In en, this message translates to:
  /// **'Low mood or loss of interest has been weighing on you.'**
  String get distressAreaMood;

  /// No description provided for @distressUrgentCta.
  ///
  /// In en, this message translates to:
  /// **'Get support now'**
  String get distressUrgentCta;

  /// No description provided for @distressTalkCta.
  ///
  /// In en, this message translates to:
  /// **'Email us for guidance'**
  String get distressTalkCta;

  /// No description provided for @distressTryCta.
  ///
  /// In en, this message translates to:
  /// **'Try a calming exercise'**
  String get distressTryCta;

  /// No description provided for @distressRetake.
  ///
  /// In en, this message translates to:
  /// **'Take it again'**
  String get distressRetake;

  /// No description provided for @distressDraft.
  ///
  /// In en, this message translates to:
  /// **'DEBUG: wording and cut-offs pending clinical review. Urdu wording not yet validated.'**
  String get distressDraft;

  /// No description provided for @exStepOf.
  ///
  /// In en, this message translates to:
  /// **'Step {n} of {total}'**
  String exStepOf(int n, int total);

  /// No description provided for @distressNote.
  ///
  /// In en, this message translates to:
  /// **'This was a short check for awareness. It is not a diagnosis.'**
  String get distressNote;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

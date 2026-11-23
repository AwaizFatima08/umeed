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

  /// No description provided for @helplines.
  ///
  /// In en, this message translates to:
  /// **'Helplines'**
  String get helplines;

  /// No description provided for @helplineUnverified.
  ///
  /// In en, this message translates to:
  /// **'DEBUG: helpline numbers are not yet clinically verified.'**
  String get helplineUnverified;

  /// No description provided for @findHelpline.
  ///
  /// In en, this message translates to:
  /// **'Not in this list? Search for a helpline in your country at findahelpline.com.'**
  String get findHelpline;

  /// No description provided for @callNow.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get callNow;

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

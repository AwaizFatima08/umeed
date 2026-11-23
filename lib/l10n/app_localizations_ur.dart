// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appName => 'امید';

  @override
  String get navToday => 'آج';

  @override
  String get navCalm => 'سکون';

  @override
  String get navRelease => 'ہلکا کریں';

  @override
  String get navMe => 'میرا';

  @override
  String get helpNow => 'مجھے ابھی مدد چاہیے';

  @override
  String get todayPrompt => 'ایک لمحہ رکیں۔ آج آپ کیسے ہیں؟';

  @override
  String lastFelt(String feeling) {
    return 'پچھلی بار آپ نے بتایا تھا: $feeling۔';
  }

  @override
  String get checkInCta => 'حال بتائیں';

  @override
  String get calmCta => 'آہستہ سانس';

  @override
  String get releaseCta => 'لکھیں اور ہلکا ہو جائیں';

  @override
  String get disclaimer =>
      'امید خود مدد اور رہنمائی کے لیے ہے۔ یہ طبی مشورہ یا ہنگامی خدمت نہیں ہے۔';

  @override
  String get feelingCalm => 'سکون';

  @override
  String get feelingOkay => 'ٹھیک ٹھاک';

  @override
  String get feelingTired => 'تھکن';

  @override
  String get feelingAnxious => 'بے چینی';

  @override
  String get feelingSad => 'اداسی';

  @override
  String get feelingNumb => 'بے حسی';

  @override
  String get feelingAngry => 'غصہ';

  @override
  String get feelingOverwhelmed => 'بوجھ';

  @override
  String get feelingHopeful => 'امید';

  @override
  String get checkInTitle => 'آپ کیسا محسوس کر رہے ہیں؟';

  @override
  String get energyLabel => 'توانائی';

  @override
  String get energyLow => 'کم';

  @override
  String get energyHigh => 'زیادہ';

  @override
  String get noteHint => 'کچھ کہنا چاہیں تو لکھیں (اختیاری)';

  @override
  String get save => 'محفوظ کریں';

  @override
  String get checkInSaved =>
      'حال بتانے کا شکریہ۔ یہ آسان نہیں تھا، اور یہ اہم ہے۔';

  @override
  String get calmTitle => 'سکون';

  @override
  String get calmIntro => 'چند آہستہ سانسیں جسم کو سکون دے سکتی ہیں۔';

  @override
  String get breathingTitle => 'آہستہ سانس';

  @override
  String get breatheIn => 'سانس اندر لیں';

  @override
  String get breatheOut => 'سانس باہر چھوڑیں';

  @override
  String get start => 'شروع کریں';

  @override
  String get stop => 'روکیں';

  @override
  String get releaseTitle => 'لکھیں اور ہلکا ہو جائیں';

  @override
  String get releaseHint => 'جو بوجھ ہے وہ لکھ دیں۔ یہ محفوظ نہیں ہوگا۔';

  @override
  String get release => 'چھوڑ دیں';

  @override
  String get released => 'چھوڑ دیا۔ بات ختم، اور آپ اب بھی یہاں ہیں۔';

  @override
  String get writeAnother => 'دوبارہ لکھیں';

  @override
  String get crisisTitle => 'آپ اکیلے نہیں ہیں';

  @override
  String get crisisBody =>
      'یہ گھڑی گزر جائے گی۔ اگر آپ خطرے میں ہو سکتے ہیں تو براہِ کرم ابھی اپنے مقامی ہنگامی نمبر پر کال کریں۔';

  @override
  String get helplines => 'مدد کی ہیلپ لائنز';

  @override
  String get helplineUnverified =>
      'ڈیبگ: ہیلپ لائن نمبر ابھی طبی طور پر تصدیق شدہ نہیں ہیں۔';

  @override
  String get findHelpline =>
      'آپ کا ملک اس فہرست میں نہیں؟ findahelpline.com پر اپنے ملک کی ہیلپ لائن تلاش کریں۔';

  @override
  String get callNow => 'کال کریں';

  @override
  String get groundingCta => 'ایک منٹ آہستہ سانس لیں';

  @override
  String get meTitle => 'میرا';

  @override
  String get language => 'زبان';

  @override
  String get english => 'English';

  @override
  String get urdu => 'اردو';

  @override
  String get about => 'تعارف';

  @override
  String get aboutBody =>
      'امید تناؤ، فکر اور اداسی میں ایک نجی ساتھی ہے۔ سب کچھ اسی فون پر رہتا ہے۔';

  @override
  String get debugBuild => 'ڈیبگ ورژن۔ ریلیز کے لیے نہیں۔';
}

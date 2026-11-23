import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Overridden in `main()` once preferences are loaded.
final sharedPrefsProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('sharedPrefsProvider must be overridden'),
);

class LocaleController extends Notifier<Locale> {
  static const _key = 'locale';

  @override
  Locale build() {
    final code = ref.read(sharedPrefsProvider).getString(_key);
    return Locale(code == 'ur' ? 'ur' : 'en');
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    await ref.read(sharedPrefsProvider).setString(_key, locale.languageCode);
  }
}

final localeProvider = NotifierProvider<LocaleController, Locale>(
  LocaleController.new,
);

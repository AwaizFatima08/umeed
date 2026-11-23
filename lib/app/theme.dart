import 'package:flutter/material.dart';

const _seed = Color(0xFF5B8A7A);

/// Urdu UI chrome uses Naskh for legibility at small sizes; long reading text
/// uses Nastaliq through [contentStyle].
ThemeData buildTheme(Brightness brightness, Locale locale) {
  final isUrdu = locale.languageCode == 'ur';
  final scheme = ColorScheme.fromSeed(seedColor: _seed, brightness: brightness);
  final light = brightness == Brightness.light;
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    fontFamily: isUrdu ? 'NotoNaskhArabic' : null,
    scaffoldBackgroundColor: light ? const Color(0xFFFAF6F0) : null,
    appBarTheme: AppBarTheme(
      backgroundColor: light ? const Color(0xFFFAF6F0) : null,
      surfaceTintColor: Colors.transparent,
    ),
    cardTheme: const CardThemeData(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
  );
}

/// Style for longer reading text; switches to Nastaliq with generous line
/// height for Urdu.
TextStyle contentStyle(BuildContext context, TextStyle? base) {
  final isUrdu = Localizations.localeOf(context).languageCode == 'ur';
  final style = base ?? const TextStyle();
  if (!isUrdu) return style.copyWith(height: 1.5);
  return style.copyWith(fontFamily: 'NotoNastaliqUrdu', height: 2.1);
}

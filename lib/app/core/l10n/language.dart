import 'dart:ui';

import 'package:athar/app/core/l10n/locales.dart';

enum Language {
  arabic('ar', Locales.arabic, 'العربية'),
  english('en', Locales.english, 'English');

  final Locale locale;
  final String code;
  final String name;

  const Language(this.code, this.locale, this.name);
}

extension LanguageX on Language {
  bool get isArabic => this == Language.arabic;
  bool get isEnglish => this == Language.english;
}

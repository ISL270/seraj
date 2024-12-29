import 'package:athar/app/core/l10n/language.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Settings extends Equatable {
  final Language language;
  final ThemeMode themeMode;

  const Settings({
    this.language = Language.arabic,
    this.themeMode = ThemeMode.light,
  });

  @override
  List<Object> get props => [
        language,
        themeMode,
      ];
}

extension SettingsX on Settings {
  Settings copyWith({
    Language? language,
    ThemeMode? themeMode,
  }) {
    return Settings(
      language: language ?? this.language,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  // Getters
  bool get isThemeDark => themeMode == ThemeMode.dark;
  bool get isThemeLight => themeMode == ThemeMode.light;

  bool get isArabic => language == Language.arabic;
  bool get isEnglish => language == Language.english;
}

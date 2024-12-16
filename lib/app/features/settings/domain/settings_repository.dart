import 'package:athar/app/core/l10n/language.dart';
import 'package:athar/app/features/settings/data/sources/local/settings_isar_source.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
final class SettingsRepository {
  final SettingsIsarSource _localSource;

  SettingsRepository(this._localSource);

  Future<int> putSettings(SettingsState settingsState) async {
    final result = await _localSource.putSettings(settingsState);
    return result;
  }

  Future<SettingsState?> getSettings() async {
    final settingsState = await _localSource.getSettings();
    return settingsState;
  }

  Future<void> clearSettings() async {
    await _localSource.clearSettings();
  }

  Future<void> updateLanguage(Language newLanguage) async {
    await _localSource.updateLanguage(newLanguage);
  }

  Future<void> toggleLanguage() async {
    await _localSource.toggleLanguage();
  }

  Future<void> updateTheme(ThemeMode newThemeMode) async {
    await _localSource.updateTheme(newThemeMode);
  }
}

import 'dart:async';
import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/core/l10n/language.dart';
import 'package:athar/app/features/settings/data/sources/local/settings_isar.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
final class SettingsIsarSource extends IsarSource<SettingsState, SettingsIsar> {
  SettingsIsarSource(super.isarService);

  @override
  SettingsIsar fromDomain(SettingsState domain) =>
      SettingsIsar.fromDomain(domain);

  Future<int> putSettings(SettingsState settingsState) {
    final settingsIsar = fromDomain(settingsState);
    return isarService.put<SettingsIsar>(settingsIsar);
  }

  Future<SettingsState?> getSettings() async {
    final settingsIsar = await isarService.getFirst<SettingsIsar>();
    return settingsIsar?.toDomain();
  }

  Future<void> clearSettings() async {
    await isarService.clear<SettingsIsar>();
  }

  Future<void> updateLanguage(Language newLanguage) async {
    final currentState = await getSettings();
    if (currentState != null) {
      final updatedState = currentState.copyWith(language: newLanguage);
      await putSettings(updatedState);
    } else {
      // Initialize with default state if currentState is null
      await putSettings(
          SettingsState(const Initial(), newLanguage, ThemeMode.system));
    }
  }

  Future<void> toggleLanguage() async {
    final currentState = await getSettings();
    if (currentState != null) {
      final newLanguage = currentState.language == Language.arabic
          ? Language.english
          : Language.arabic;
      final updatedState = currentState.copyWith(language: newLanguage);
      await putSettings(updatedState);
    } else {
      // Initialize with default state if currentState is null
      await putSettings(
          const SettingsState(Initial(), Language.english, ThemeMode.system));
    }
  }

  Future<void> updateTheme(ThemeMode newThemeMode) async {
    final currentState = await getSettings();
    if (currentState != null) {
      final updatedState = currentState.copyWith(themeMode: newThemeMode);
      await putSettings(updatedState);
    } else {
      // Initialize with default state if currentState is null
      await putSettings(
          SettingsState(const Initial(), Language.english, newThemeMode));
    }
  }
}

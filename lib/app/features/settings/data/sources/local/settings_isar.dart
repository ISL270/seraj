import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/core/l10n/language.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'settings_isar.g.dart';

@collection
final class SettingsIsar extends CacheModel<SettingsState> {
  @override
  final String id;
  final String languageCode;
  final String themeMode;

  SettingsIsar({
    required this.id,
    required this.languageCode,
    required this.themeMode,
  });

  // Convert SettingsState to SettingsIsar
  factory SettingsIsar.fromDomain(SettingsState domain) {
    return SettingsIsar(
      id: domain.status is Initial
          ? 'initial'
          : 'non_initial', // Example logic for id
      languageCode: domain.language.code,
      themeMode: domain.themeMode.name,
    );
  }

  // Convert SettingsIsar back to SettingsState
  @override
  SettingsState toDomain() {
    return SettingsState(
      Status.fromJson(
          languageCode), // Example, replace with actual status logic
      Language.values.firstWhere((lang) => lang.code == languageCode),
      ThemeMode.values.firstWhere((mode) => mode.name == themeMode),
    );
  }

  @override
  Id get cacheID => id.hashCode;
}

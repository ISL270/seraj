import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/core/l10n/language.dart';
import 'package:athar/app/features/settings/domain/settings.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'settings_isar.g.dart';

@collection
final class SettingsIsar extends CacheModel<Settings> {
  @override
  final String id = 'settings';
  @override
  final Id cacheID = Isar.autoIncrement;
  @enumerated
  final Language language;
  @enumerated
  final ThemeMode themeMode;

  SettingsIsar({
    required this.language,
    required this.themeMode,
  });

  factory SettingsIsar.fromDomain(Settings dm) => SettingsIsar(
        language: dm.language,
        themeMode: dm.themeMode,
      );

  @override
  Settings toDomain() => Settings(
        language: language,
        themeMode: themeMode,
      );
}

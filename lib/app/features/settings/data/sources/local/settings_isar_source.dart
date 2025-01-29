import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/features/settings/data/sources/local/settings_isar.dart';
import 'package:athar/app/features/settings/domain/settings.dart';
import 'package:injectable/injectable.dart';

@singleton
final class SettingsIsarSource extends IsarSource<Settings, SettingsIsar> {
  SettingsIsarSource(super.isarService);

  void updateSettings(Settings settings) {
    clear();
    put(SettingsIsar(language: settings.language, themeMode: settings.themeMode));
  }

  SettingsIsar fromDomain(Settings dm) => SettingsIsar.fromDomain(dm);
}

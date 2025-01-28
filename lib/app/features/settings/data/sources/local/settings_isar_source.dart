import 'dart:async';

import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/features/settings/data/sources/local/settings_isar.dart';
import 'package:athar/app/features/settings/domain/settings.dart';
import 'package:injectable/injectable.dart';

@singleton
final class SettingsIsarSource extends IsarSource<Settings, SettingsIsar> {
  SettingsIsarSource(super.isarService);

  Future<void> updateSettings(Settings settings) async {
    await clear();
    final settingsIsar = SettingsIsar.fromDomain(settings);
    await isarService.put(settingsIsar);
  }

  @override
  SettingsIsar fromDomain(Settings dm) => SettingsIsar.fromDomain(dm);
}

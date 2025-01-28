import 'package:athar/app/features/settings/data/sources/local/settings_isar_source.dart';
import 'package:athar/app/features/settings/domain/settings.dart';
import 'package:injectable/injectable.dart';

@singleton
final class SettingsRepository {
  final SettingsIsarSource _localSource;

  const SettingsRepository(this._localSource);

  Future<void> updateSettings(Settings settings) async => _localSource.updateSettings(settings);

  Settings getSettings() => _localSource.first?.toDomain() ?? const Settings();
}

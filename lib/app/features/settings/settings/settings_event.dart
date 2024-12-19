part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

final class SettingsLanguageChanged extends SettingsEvent {
  final Language language;
  const SettingsLanguageChanged(this.language);

  @override
  List<Object> get props => [language];
}

final class SettingsThemeChanged extends SettingsEvent {
  final ThemeMode themeMode;
  const SettingsThemeChanged(this.themeMode);

  @override
  List<Object> get props => [themeMode];
}

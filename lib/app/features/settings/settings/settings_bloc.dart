import 'dart:async';

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/l10n/language.dart';
import 'package:athar/app/features/settings/domain/settings.dart';
import 'package:athar/app/features/settings/domain/settings_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'settings_event.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository _repository;

  SettingsBloc(this._repository) : super(const Initial(Settings())) {
    on<SettingsLanguageChanged>(_onLanguageChanged);
    on<SettingsThemeChanged>(_onThemeChanged);
    on<SettingsFetched>(_onFetched);

    add(const SettingsFetched());
  }

  Future<void> _onFetched(
    SettingsFetched event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.toLoading());
    final savedSettings = _repository.getSettings();
    emit(state.toSuccess(savedSettings));
  }

  Future<void> _onLanguageChanged(
    SettingsLanguageChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final newSettings = state.settings.copyWith(language: event.language);
    emit(state.toSuccess(newSettings));
    unawaited(_repository.updateSettings(newSettings));
  }

  Future<void> _onThemeChanged(
    SettingsThemeChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final newSettings = state.settings.copyWith(themeMode: event.themeMode);
    emit(state.toSuccess(newSettings));
    unawaited(_repository.updateSettings(newSettings));
  }
}

typedef SettingsState = Status<Settings>;

extension X on SettingsState {
  Settings get settings => switch (this) {
        Initial<Settings>(initialData: final settings) => settings!,
        Success<Settings>(newData: final settings) => settings,
        Failure<Settings>(oldData: final settings) => settings!,
        Loading<Settings>(currentData: final settings) => settings!,
      };
}

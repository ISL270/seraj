import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/l10n/language.dart';
import 'package:athar/app/features/settings/domain/settings_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'settings_bloc.g.dart';
part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(this._repository) : super(const SettingsState.initial()) {
    on<SettingsLanguageChanged>(_onLanguageChanged);
    on<SettingsThemeChanged>(_onThemeChanged);

    _initialize();
  }
  final SettingsRepository _repository;

  /// Initializes the state from the repository.
  Future<void> _initialize() async {
    final savedSettings = await _repository.getSettings();
    if (savedSettings != null) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(savedSettings);
    }
  }

  /// Handles language change events.
  Future<void> _onLanguageChanged(
    SettingsLanguageChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final newState = state.copyWith(language: event.language);
    emit(newState);
    await _repository.updateLanguage(event.language);
  }

  /// Handles theme change events.
  Future<void> _onThemeChanged(
    SettingsThemeChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final newState = state.copyWith(themeMode: event.themeMode);
    emit(newState);
    await _repository.updateTheme(event.themeMode);
  }
}

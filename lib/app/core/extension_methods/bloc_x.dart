import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension Blocs on BuildContext {
  SettingsBloc get settingsBloc => read<SettingsBloc>();
}

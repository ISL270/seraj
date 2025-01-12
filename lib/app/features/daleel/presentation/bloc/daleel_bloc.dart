// ignore_for_file: unnecessary_statements

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'daleel_event.dart';
part 'daleel_state.dart';

class DaleelBloc extends Bloc<DaleelEvent, DaleelState> {
  DaleelBloc() : super(DaleelState._initial()) {
    on<DaleelEvent>((event, emit) {
      if (event is DaleelTypeFilterChanged) {
        emit(state.copyWith(selectedDaleelType: event.daleelType));
      } else if (event is DaleelPriorityFilterChanged) {
        emit(state.copyWith(selectedPriority: event.priority));
      } else if (event is DaleelDateFilterChanged) {
        emit(state.copyWith(selectedDate: event.date));
      }
    });
  }
}

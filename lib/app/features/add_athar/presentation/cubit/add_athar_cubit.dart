// ignore_for_file: void_checks

import 'dart:developer';

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/add_athar/presentation/cubit/add_athar_state.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:form_inputs/form_inputs.dart';

class AddAtharCubit extends Cubit<AddAtharState> {
  final DaleelRepository _repository;
  AddAtharCubit(this._repository) : super(const AddAtharState());

  void atharChanged(String athar) => emit(state.copyWith(athar: Name.dirty(athar)));

  void sayerChanged(String sayer) => emit(state.copyWith(sayer: sayer));

  void explainationChanged(String explaination) => emit(state.copyWith(description: explaination));

  void sliderPriorityChanged(double value) => emit(state.copyWith(sliderValue: value));

  Future<void> saveAtharForm() async {
    emit(state.copyWith(status: const Loading()));
    try {
      await _repository.saveAthar(
        text: state.athar.value,
        sayer: state.sayer,
        description: state.description,
        priority: getPriority(state.sliderValue),
        lastRevisedAt: DateTime.now(),
        tags: [], // not used for now
      );
      emit(state.copyWith(status: const Success('Athar added successfully')));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: Failure(e as GenericException)));
    }
  }

  // used cause slider only returns double values
  Priority getPriority(double value) {
    if (value == 0.0) {
      return Priority.normal;
    } else if (value == 1.0) {
      return Priority.high;
    } else {
      return Priority.urgent;
    }
  }
}

import 'dart:developer';

import 'package:athar/app/features/add_athar/presentation/cubit/add_athar_state.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:bloc/bloc.dart';
import 'package:form_inputs/form_inputs.dart';

class AddAtharCubit extends Cubit<AddAtharState> {
  AddAtharCubit() : super(const AddAtharState());

  void atharChanged(String athar) => emit(state.copyWith(athar: Name.dirty(athar)));

  void sayerChanged(String sayer) => emit(state.copyWith(sayer: sayer));

  void explainationChanged(String explaination) => emit(state.copyWith(description: explaination));

  void sliderPriorityChanged(double value) => emit(state.copyWith(sliderValue: value));

  Future<void> saveAtharForm() async {
    log(state.athar.value);
    log(state.sayer);
    log(state.description);
    log(getPriority(state.sliderValue).toString());
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

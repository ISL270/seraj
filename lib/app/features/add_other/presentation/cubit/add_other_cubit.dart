import 'dart:developer';

import 'package:athar/app/features/add_other/presentation/cubit/add_other_state.dart';
import 'package:bloc/bloc.dart';
import 'package:form_inputs/form_inputs.dart';

class AddOtherCubit extends Cubit<AddOtherState> {
  AddOtherCubit() : super(const AddOtherState());

  void otherTextChanged(String value) => emit(state.copyWith(other: Name.dirty(value)));

  void sayerChanged(String value) => emit(state.copyWith(sayer: value));

  void explanationChanged(String value) => emit(state.copyWith(description: value));

  void sliderPriorityChanged(double value) => emit(state.copyWith(sliderValue: value));

  Future<void> saveOtherForm() async {
    log(state.other.value);
    log(state.sayer);
    log(state.description);
    log(state.sliderValue.toString());
  }
}

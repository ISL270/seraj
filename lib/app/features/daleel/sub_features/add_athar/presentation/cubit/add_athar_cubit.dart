// ignore_for_file: void_checks

import 'dart:developer';

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/generic_exception.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:athar/app/features/daleel/sub_features/add_athar/presentation/cubit/add_athar_state.dart';
import 'package:bloc/bloc.dart';
import 'package:form_inputs/form_inputs.dart';

class AddAtharCubit extends Cubit<AddAtharState> {
  final DaleelRepository _repository;
  AddAtharCubit(this._repository) : super(const AddAtharState());

  void atharChanged(String athar) => emit(state.copyWith(athar: Name.dirty(athar)));

  void sayerChanged(String sayer) => emit(state.copyWith(sayer: sayer));

  void explainationChanged(String explaination) => emit(state.copyWith(description: explaination));

  void sliderPriorityChanged(double value) => emit(state.copyWith(sliderValue: value));

  void tagsChanged(Set<Tag> newTags) {
    emit(state.copyWith(tags: newTags));
  }

  Future<void> saveAtharForm() async {
    emit(state.copyWith(status: const Loading()));
    try {
      await _repository.saveAthar(
        sayer: state.sayer,
        text: state.athar.value,
        description: state.description,
        priority: Priority.fromDouble(state.sliderValue),
        tags: state.tags,
      );
      emit(state.copyWith(status: const Success(null)));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: Failure(e as GenericException)));
    }
  }
}

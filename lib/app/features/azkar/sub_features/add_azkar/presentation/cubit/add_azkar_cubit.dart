// ignore_for_file: void_checks

import 'dart:developer';

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/generic_exception.dart';
import 'package:athar/app/features/azkar/domain/azkar_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartx/dartx_io.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
part 'add_azkar_state.dart';

class AddAzkarCubit extends Cubit<AddAzkarState> {
  final AzkarRepository _repository;
  AddAzkarCubit(this._repository) : super(const AddAzkarState());

  TextEditingController noOfRepetitionsController = TextEditingController();

  void textOfAzkarChanged(String value) => emit(state.copyWith(text: Name.dirty(value)));

  void explanationChanged(String value) => emit(state.copyWith(explanation: value));

  void noOfRepetitionsChanged(int value) => emit(state.copyWith(noOfRepeats: value));

  Future<void> saveAzkarForm() async {
    emit(state.copyWith(status: const Loading()));
    try {
      _repository.addAzkar(
        text: state.text.value,
        description: state.explanation,
        noOfRepetitions:
            noOfRepetitionsController.text.isEmpty || noOfRepetitionsController.text == '0'
                ? 1
                : noOfRepetitionsController.text.toInt(),
        tags: [],
      );
      emit(state.copyWith(status: const Success('Added Azkar Successfully')));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: Failure(e as GenericException)));
    }
  }

  @override
  Future<void> close() async {
    noOfRepetitionsController.dispose();
    return super.close();
  }
}

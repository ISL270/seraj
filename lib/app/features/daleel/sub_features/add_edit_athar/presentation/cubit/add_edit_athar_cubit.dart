// ignore_for_file: void_checks, unnecessary_null_comparison

import 'dart:developer';

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/models/generic_exception.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_athar/presentation/cubit/add_edit_athar_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddOrEditAtharCubit extends Cubit<AddOrEditAtharState> {
  final DaleelRepository _repository;

  late TextEditingController textOfAtharCtrlr;
  late TextEditingController sayerOfAtharCtrlr;
  late TextEditingController descOfAtharCtrlr;

  AddOrEditAtharCubit(this._repository) : super(const AddOrEditAtharState()) {
    textOfAtharCtrlr = TextEditingController();
    sayerOfAtharCtrlr = TextEditingController();
    descOfAtharCtrlr = TextEditingController();
  }

  void atharChanged(String athar) =>
      emit(state.copyWith(athar: Name.dirty(athar)));

  void sayerChanged(String sayer) => emit(state.copyWith(sayer: sayer));

  void explainationChanged(String explaination) =>
      emit(state.copyWith(description: explaination));

  void sliderPriorityChanged(double value) =>
      emit(state.copyWith(sliderValue: value));

  void tagsChanged(Set<Tag> newTags) {
    emit(state.copyWith(tags: newTags));
  }

  void initializeAthar(int? daleelId) {
    if (daleelId == null) {
    } else {
      emit(state.copyWith(status: const Loading()));

      log(daleelId.toString());

      final daleel = _repository.get(daleelId);

      textOfAtharCtrlr.text = daleel?.text ?? '';
      sayerOfAtharCtrlr.text = daleel?.sayer ?? '';
      descOfAtharCtrlr.text = daleel?.description ?? '';
      emit(state.copyWith(
        atharId: daleelId,
        athar: Name.dirty(textOfAtharCtrlr.text),
        sayer: sayerOfAtharCtrlr.text,
        description: descOfAtharCtrlr.text,
        sliderValue: daleel?.priority.index.toDouble() ?? 0.0,
        tags: daleel?.tags ?? {},
      ));

      emit(state.copyWith(
          status: const Success('Initialized Athar Successfully')));
    }
  }

  Future<void> saveOrUpdateAtharForm() async {
    emit(state.copyWith(status: const Loading()));
    try {
      await _repository.saveOrUpdateAthar(
        id: state.atharId,
        sayer: state.sayer,
        text: state.athar.value,
        textWithoutDiacritics: state.athar.value.removeDiacritics(),
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

  @override
  Future<void> close() {
    textOfAtharCtrlr.dispose();
    sayerOfAtharCtrlr.dispose();
    descOfAtharCtrlr.dispose();
    return super.close();
  }
}

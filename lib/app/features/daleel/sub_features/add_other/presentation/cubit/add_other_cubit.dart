// ignore_for_file: void_checks

import 'dart:developer';

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/generic_exception.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:athar/app/features/daleel/sub_features/add_other/presentation/cubit/add_other_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddOrEditOtherCubit extends Cubit<AddOtherState> {
  final DaleelRepository _repository;

  late TextEditingController otherTextCtrlr;
  late TextEditingController otherSayerCtrlr;
  late TextEditingController otherExplainCtrlr;

  AddOrEditOtherCubit(this._repository) : super(const AddOtherState()) {
    otherTextCtrlr = TextEditingController();
    otherSayerCtrlr = TextEditingController();
    otherExplainCtrlr = TextEditingController();
  }

  void otherTextChanged(String value) => emit(state.copyWith(other: Name.dirty(value)));

  void sayerChanged(String value) => emit(state.copyWith(sayer: value));

  void explanationChanged(String value) => emit(state.copyWith(description: value));

  void sliderPriorityChanged(double value) => emit(state.copyWith(sliderValue: value));

  void tagsChanged(Set<Tag> newTags) {
    emit(state.copyWith(tags: newTags));
  }

  void initializeOther(int? otherId) {
    if (otherId == null) {
    } else {
      emit(state.copyWith(status: const Loading()));

      final other = _repository.get(otherId);

      otherTextCtrlr.text = other!.text;
      otherSayerCtrlr.text = other.sayer ?? '';
      otherExplainCtrlr.text = other.description ?? '';

      emit(state.copyWith(
        otherId: otherId,
        other: Name.dirty(otherTextCtrlr.text),
        sayer: otherSayerCtrlr.text,
        description: otherExplainCtrlr.text,
        sliderValue: other.priority.index.toDouble(),
        tags: other.tags,
      ));

      emit(state.copyWith(status: const Success('Initialized Other Successfully')));
    }
  }

  Future<void> saveOrUpdateOtherForm() async {
    emit(state.copyWith(status: const Loading()));
    try {
      await _repository.saveOrUpdateOthers(
        id: state.otherId,
        text: state.other.value,
        sayer: state.sayer,
        description: state.description,
        priority: Priority.fromDouble(state.sliderValue),
        lastRevisedAt: DateTime.now(),
        tags: state.tags,
      );
      emit(state.copyWith(status: const Success('Saved Other Successfully')));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: Failure(e as GenericException)));
    }
  }
}

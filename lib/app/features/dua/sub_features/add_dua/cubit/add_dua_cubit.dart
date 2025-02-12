import 'dart:developer';

import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/dua/domain/dua_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

part 'add_dua_state.dart';

@singleton
class AddDuaCubit extends Cubit<AddDuaState> {
  late TextEditingController textOfDua;
  late TextEditingController duaReward;
  late TextEditingController explanationOfDua;

  AddDuaCubit(this._duaRepository) : super(const AddDuaState()) {
    textOfDua = TextEditingController();
    duaReward = TextEditingController();
    explanationOfDua = TextEditingController();
  }

  final DuaRepository _duaRepository;

  void duaChanged(String value) => emit(state.copyWith(dua: Name.dirty(value)));

  void rewardOfDuaChanged(String value) => emit(state.copyWith(reward: Name.dirty(value)));

  void sliderPriorityChanged(double value) {
    emit(state.copyWith(sliderValue: value));
  }

  void priorityChanged(Priority value) => emit(state.copyWith(priority: value));

  void duaExplanationChanged(String value) => emit(state.copyWith(description: value));

  void tagsChanged(Set<Tag> newTags) {
    emit(state.copyWith(tags: newTags));
  }

  void initializeDua(int? duaId) {
    if (duaId == null) {
    } else {
      final dua = _duaRepository.get(duaId);
      textOfDua.text = dua!.text;
      duaReward.text = dua.reward ?? '';
      explanationOfDua.text = dua.description ?? '';
      emit(state.copyWith(
        duaId: duaId,
        dua: Name.dirty(dua.text),
        description: dua.description,
        tags: dua.tags,
      ));
      log(state.tags.toString());
    }
  }

  void saveDuaForm() => _duaRepository.addDuaOrUpdate(
        tags: state.tags,
        text: state.dua.value,
        reward: state.reward.value,
        description: state.description,
        id: state.duaId,
      );

  List<Tag> getTags() {
    return _duaRepository.getTags();
  }
}

// ignore_for_file: void_checks

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/azkar/domain/azkar_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartx/dartx_io.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
part 'add_or_edit_azkar_state.dart';

class AddOrEditAzkarCubit extends Cubit<AddOrEditAzkarState> {
  final AzkarRepository _repository;

  late TextEditingController textOfAzkar;
  late TextEditingController explanation;
  late TextEditingController noOfRepetitionsController;

  AddOrEditAzkarCubit(this._repository) : super(const AddOrEditAzkarState()) {
    textOfAzkar = TextEditingController();
    explanation = TextEditingController();
    noOfRepetitionsController = TextEditingController(text: '1');
  }

  void textOfAzkarChanged(String value) => emit(state.copyWith(text: Name.dirty(value)));

  void explanationChanged(String value) => emit(state.copyWith(explanation: value));

  void noOfRepetitionsChanged(int value) => emit(state.copyWith(noOfRepeats: value));

  void tagsChanged(Set<Tag> newTags) => emit(state.copyWith(tags: newTags));

  List<Tag> getTags() => _repository.getTags();

  void initializeAzkar(int? azkarId) {
    if (azkarId == null) {
    } else {
      final azkar = _repository.get(azkarId);
      textOfAzkar.text = azkar!.text;
      explanation.text = azkar.description ?? '';
      noOfRepetitionsController.text = azkar.noOfRepetitions.toString();

      emit(state.copyWith(
        azkarId: azkarId,
        text: Name.dirty(azkar.text),
        explanation: azkar.description,
        noOfRepeats: azkar.noOfRepetitions,
        tags: azkar.tags,
      ));
    }
  }

  void addOrUpdateAzkarForm() => _repository.addOrUpdateAzkar(
        id: state.azkarId,
        text: state.text.value,
        description: state.explanation,
        noOfRepetitions:
            noOfRepetitionsController.text.isEmpty || noOfRepetitionsController.text == '0'
                ? 1
                : noOfRepetitionsController.text.toInt(),
        tags: state.tags,
      );

  @override
  Future<void> close() async {
    textOfAzkar.dispose();
    explanation.dispose();
    noOfRepetitionsController.dispose();
    return super.close();
  }
}

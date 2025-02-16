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
part 'add_azkar_state.dart';

class AddAzkarCubit extends Cubit<AddAzkarState> {
  final AzkarRepository _repository;

  late TextEditingController textOfAzkar;
  late TextEditingController explanation;
  late TextEditingController noOfRepetitionsController;

  AddAzkarCubit(this._repository) : super(const AddAzkarState()) {
    textOfAzkar = TextEditingController();
    explanation = TextEditingController();
    noOfRepetitionsController = TextEditingController();
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

// ignore_for_file: inference_failure_on_instance_creation, void_checks

import 'dart:developer';

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/generic_exception.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

part 'add_edit_hadith_state.dart';

@injectable
class AddOrEditHadithCubit extends Cubit<AddOrEditHadithState> {
  final DaleelRepository _daleelRepository;

  late TextEditingController textOfHadith;
  late TextEditingController rawiOfHadith;
  late TextEditingController extractionOfHadith;
  late TextEditingController descOfHadith;
  AddOrEditHadithCubit(this._daleelRepository) : super(const AddOrEditHadithState()) {
    textOfHadith = TextEditingController();
    rawiOfHadith = TextEditingController();
    extractionOfHadith = TextEditingController();
    descOfHadith = TextEditingController();
  }

  void textOfHadithChanged(String value) => emit(state.copyWith(hadith: Name.dirty(value)));

  void rawiOfHadithChanged(String value) => emit(state.copyWith(sayer: value));

  void extractionOfHadithChanged(String value) => emit(state.copyWith(extraction: value));

  void hadithAuthenticityChanged(HadithAuthenticity hadithAuthenticity) =>
      emit(state.copyWith(authenticity: hadithAuthenticity));

  void descOfHadithChanged(String value) => emit(state.copyWith(description: value));

  void sliderPriorityChanged(double value) {
    emit(state.copyWith(sliderValue: value));
  }

  void tagsChanged(Set<Tag> newTags) {
    emit(state.copyWith(tags: newTags));
  }

  void initializeHadith(int? hadithId) {
    if (hadithId == null) {
    } else {
      emit(state.copyWith(status: const Loading()));

      final daleel = _daleelRepository.get(hadithId);
      log(daleel?.tags.toString() ?? '{}');

      textOfHadith.text = daleel!.text;
      rawiOfHadith.text = daleel.sayer ?? '';
      extractionOfHadith.text = (daleel as Hadith).extraction ?? '';
      descOfHadith.text = daleel.description ?? '';

      emit(state.copyWith(
        hadithId: hadithId,
        hadith: Name.dirty(textOfHadith.text),
        sayer: rawiOfHadith.text,
        description: descOfHadith.text,
        extraction: extractionOfHadith.text,
        authenticity: daleel.authenticity,
        sliderValue: daleel.priority.index.toDouble(),
        tags: daleel.tags,
      ));
      log(state.tags.toString());
      emit(state.copyWith(status: const Success('Initialized Hadith Successfully')));
    }
  }

  Future<void> saveOrUpdateHadithForm() async {
    emit(state.copyWith(status: const Loading()));
    try {
      await _daleelRepository.saveOrUpdateHadith(
        id: state.hadithId,
        text: state.hadith.value,
        sayer: state.sayer,
        description: state.description,
        extraction: state.extraction,
        authenticity: state.authenticity,
        priority: Priority.fromDouble(state.sliderValue),
        tags: state.tags,
      );
      emit(state.copyWith(status: const Success('Saved Hadith Successfully')));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: Failure(e as GenericException)));
    }
  }

  List<Tag> getTags() {
    return _daleelRepository.getTags();
  }

  void dispose() {
    textOfHadith.dispose();
    rawiOfHadith.dispose();
    extractionOfHadith.dispose();
    descOfHadith.dispose();
  }
}

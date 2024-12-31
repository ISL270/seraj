// ignore_for_file: inference_failure_on_instance_creation, void_checks

import 'dart:developer';

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_type.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

part 'add_hadith_state.dart';

@injectable
class AddHadithCubit extends Cubit<AddHadithState> {
  AddHadithCubit(this._daleelRepository) : super(const AddHadithState());
  final DaleelRepository _daleelRepository;

  void textOfHadithChanged(String value) => emit(state.copyWith(textOfHadith: Name.dirty(value)));

  void rawiOfHadithChanged(String value) => emit(state.copyWith(sayerOfHadith: value));

  void extractionOfHadithChanged(String value) => emit(state.copyWith(extractionOfHadith: value));

  void hadithAuthenticityChanged(HadithAuthenticity hadithAuthenticity) =>
      emit(state.copyWith(hadithAuthenticity: hadithAuthenticity));

  void descOfHadithChanged(String value) => emit(state.copyWith(descOfHadith: value));

  void sliderPriorityChanged(double value) {
    emit(state.copyWith(sliderValue: value));
  }

  Future<void> saveHadithForm() async {
    emit(state.copyWith(status: const Loading()));
    try {
      await _daleelRepository.saveHadith(
        text: state.textOfHadith.value,
        sayer: state.sayerOfHadith,
        description: state.descOfHadith,
        extraction: state.extractionOfHadith,
        authenticity: state.hadithAuthenticity,
        lastRevisedAt: DateTime.now(),
        priority: getPriority(state.sliderValue),
        tags: [], // not used for now
      );
      emit(state.copyWith(status: const Success('Saved Hadith Successfully')));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: Failure(e as GenericException)));
    }
  }

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

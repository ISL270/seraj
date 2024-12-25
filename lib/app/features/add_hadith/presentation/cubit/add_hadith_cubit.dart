// ignore_for_file: inference_failure_on_instance_creation, void_checks

import 'dart:developer';

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/add_hadith/domain/models/hadith_type.dart';
import 'package:athar/app/features/add_hadith/domain/repositories/hadith_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

part 'add_hadith_state.dart';

@injectable
class AddHadithCubit extends Cubit<AddHadithState> {
  final HadithRepository _hadithRepository;

  AddHadithCubit(this._hadithRepository) : super(const AddHadithState());

  void textOfHadithChanged(String value) => emit(state.copyWith(textOfHadith: Name.dirty(value)));

  void isnadOfHadithChanged(String value) => emit(state.copyWith(isnadOfHadith: value));

  void sourceOfHadithChanged(String value) => emit(state.copyWith(sourceOfHadith: value));

  void hadithAuthenticityChanged(HadithAuthenticity hadithAuthenticity) =>
      emit(state.copyWith(hadithAuthenticity: hadithAuthenticity));

  void hadithExplainChanged(String value) => emit(state.copyWith(hadithExplain: value));

  Future<void> saveHadithForm() async {
    emit(state.copyWith(status: const Loading()));
    try {
      await _hadithRepository.addHadith(
        textOfHadith: state.textOfHadith.value,
        hadithType: state.hadithAuthenticity,
        hadithExplain: state.hadithExplain,
        isnadOfHadith: state.isnadOfHadith,
        sourceOfHadith: state.sourceOfHadith,
      );
      emit(state.copyWith(status: const Success('Saved Hadith Successfully')));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: Failure(e as GenericException)));
    }
  }
}

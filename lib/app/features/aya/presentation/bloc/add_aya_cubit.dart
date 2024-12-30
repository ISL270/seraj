import 'dart:developer';

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/aya/domain/models/aya_model.dart';
import 'package:athar/app/features/aya/domain/repositories/aya_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

part 'add_aya_state.dart';

@singleton
class AddAyaCubit extends Cubit<AddAyaState> {
  final AyaRepository _ayaRepository;

  AddAyaCubit(this._ayaRepository) : super(const AddAyaState());

  void textOfAyaChanged(String value) =>
      emit(state.copyWith(textOfAya: Name.dirty(value)));

  void surahOfAyaChanged(String value) =>
      emit(state.copyWith(surahOfAya: Name.dirty(value)));

  void nomOfAyaChanged(String value) => emit(state.copyWith(numOfAya: value));

  void ayaExplainChanged(String value) =>
      emit(state.copyWith(ayaExplain: value));

  Future<void> saveAyaForm() async {
    emit(state.copyWith(status: const Loading()));
    try {
      await _ayaRepository.saveAya(
        ayaModel: AyaModel(
          textOfAya: state.textOfAya.value,
          surahOfAya: state.surahOfAya.value,
          nomOfAya: state.numOfAya,
        ),
      );
      emit(state.copyWith(status: const Success('Saved Aya Successfully')));
      log('Saved Aya Successfully');
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: Failure(e as GenericException)));
    }
  }
}

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/aya/domain/models/aya_model.dart';
import 'package:athar/app/features/aya/domain/repositories/aya_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_quran/flutter_quran.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'add_aya_state.dart';

class AddAyaCubit extends Cubit<AddAyaState> {
  final AyaRepository _ayaRepository;

  AddAyaCubit({
    required AyaRepository ayaRepository,
    required List<Ayah> ayah,
  })  : _ayaRepository = ayaRepository,
        super(AddAyaState(
          textOfAya:
              Name.dirty(ayah.map((singleAyah) => singleAyah.ayah).join(' ')),
          surahOfAya: Name.dirty(ayah.first.surahNameAr),
          numOfAya: ayah.first.ayahNumber.toString(),
          ayaExplain: const Name.dirty(''),
        ));

  void textOfAyaChanged(String value) =>
      emit(state.copyWith(textOfAya: Name.dirty(value)));

  void surahOfAyaChanged(String value) =>
      emit(state.copyWith(surahOfAya: Name.dirty(value)));

  void nomOfAyaChanged(String value) => emit(state.copyWith(numOfAya: value));

  void ayaExplainChanged(String value) =>
      emit(state.copyWith(ayaExplain: Name.dirty(value)));

  Future<void> saveAyaForm() async {
    emit(state.copyWith(status: const Loading()));
    try {
      await _ayaRepository.saveAya(
        ayaModel: AyaModel(
          textOfAya: state.textOfAya.value,
          surahOfAya: state.surahOfAya.value,
          nomOfAya: state.numOfAya,
          ayaExplain: state.ayaExplain.value,
        ),
      );
      emit(state.copyWith(status: const Success('Saved Aya Successfully')));
    } catch (e) {
      emit(state.copyWith(status: Failure(e as GenericException)));
    }
  }
}

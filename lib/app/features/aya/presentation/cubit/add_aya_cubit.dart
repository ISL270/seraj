import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/extension_methods/double_x.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_quran/flutter_quran.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'add_aya_state.dart';

class AddAyaCubit extends Cubit<AddAyaState> {
  final DaleelRepository _daleelRepository;

  AddAyaCubit({
    required DaleelRepository ayaRepository,
    required List<Ayah> ayah,
  })  : _daleelRepository = ayaRepository,
        super(AddAyaState(
          textOfAya:
              Name.dirty(ayah.map((singleAyah) => singleAyah.ayah).join(' ')),
          surahOfAya: Name.dirty(ayah.first.surahNameAr),
          firstAya: ayah.first.ayahNumber,
          lastAya: ayah.last.ayahNumber,
          ayaExplain: const Name.dirty(''),
        ));

  void textOfAyaChanged(String value) =>
      emit(state.copyWith(textOfAya: Name.dirty(value)));

  void surahOfAyaChanged(String value) =>
      emit(state.copyWith(surahOfAya: Name.dirty(value)));

  void nomOfAyaChanged(String value) => emit(state.copyWith(numOfAya: value));

  void ayaExplainChanged(String value) =>
      emit(state.copyWith(ayaExplain: Name.dirty(value)));

  void tagsChanged(List<String> newTags) {
    // Remove empty or duplicate tags from the input list
    final uniqueTags = newTags.toSet().toList()
      ..removeWhere((tag) => tag.isEmpty);

    // Only emit a new state if the tags have actually changed
    if (uniqueTags.toString() != state.tags.toString()) {
      emit(state.copyWith(tags: uniqueTags));
    }
  }

  Future<void> saveAyaForm() async {
    emit(state.copyWith(status: const Loading()));
    try {
      await _daleelRepository.saveAya(
        text: state.textOfAya.value,
        ayaExplain: state.ayaExplain.value,
        surahOfAya: state.surahOfAya.value,
        firstAya: state.firstAya,
        lastAya: state.lastAya,
        lastRevisedAt: DateTime.now(),
        priority: 1.0.getPriority(),
        tags: state.tags,
      );
      emit(state.copyWith(status: const Success('Saved Aya Successfully')));
    } catch (e) {
      emit(state.copyWith(status: Failure(e as GenericException)));
    }
  }
}

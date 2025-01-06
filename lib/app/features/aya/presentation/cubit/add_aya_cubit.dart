import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/extension_methods/double_x.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quran/flutter_quran.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'add_aya_state.dart';

class AddAyaCubit extends Cubit<AddAyaState> {
  final DaleelRepository _daleelRepository;
  late TextEditingController surahController;
  late TextEditingController firstAyahController;
  late TextEditingController lastAyahController;
  late TextEditingController explanationController;

  AddAyaCubit({
    required DaleelRepository ayaRepository,
  })  : _daleelRepository = ayaRepository,
        super(const AddAyaState()) {
    surahController = TextEditingController();
    firstAyahController = TextEditingController();
    lastAyahController = TextEditingController();
    explanationController = TextEditingController();

    _initializeListeners();
  }

  void _initializeListeners() {
    surahController.addListener(() {
      surahOfAyaChanged(surahController.text);
    });
    firstAyahController.addListener(() {
      final value = int.tryParse(firstAyahController.text);
      if (value != null) {
        nomOfAyaChanged(value);
      }
    });
    explanationController.addListener(() {
      ayaExplainChanged(explanationController.text);
    });
  }

  void textOfAyaChanged(String value) => emit(state.copyWith(textOfAya: Name.dirty(value)));

  void surahOfAyaChanged(String value) => emit(state.copyWith(surahOfAya: Name.dirty(value)));

  void nomOfAyaChanged(int value) => emit(state.copyWith(firstAya: value));

  void ayaExplainChanged(String value) => emit(state.copyWith(ayaExplain: Name.dirty(value)));

  void queryChanged(String value) {
    final ayahsList = FlutterQuran().search(value);
    emit(state.copyWith(query: value, ayahs: ayahsList));
  }

  void _updateControllers() {
    if (state.selectedAyahs.isNotEmpty) {
      surahController.text = state.selectedAyahs[0].surahNameAr;
      firstAyahController.text = state.selectedAyahs.first.ayahNumber.toString();
      lastAyahController.text = state.selectedAyahs.last.ayahNumber.toString();
      explanationController.text = state.ayaExplain.value;
    }
  }

  void ayahsChanged(List<Ayah> ayahs) {
    emit(state.copyWith(selectedAyahs: ayahs, query: '', ayahs: []));
    _updateControllers();
  }

  void tagsChanged(List<String> newTags) {
    final uniqueTags = newTags.toSet().toList()..removeWhere((tag) => tag.isEmpty);
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

  @override
  Future<void> close() {
    // Dispose controllers
    surahController.dispose();
    firstAyahController.dispose();
    lastAyahController.dispose();
    explanationController.dispose();
    return super.close();
  }
}

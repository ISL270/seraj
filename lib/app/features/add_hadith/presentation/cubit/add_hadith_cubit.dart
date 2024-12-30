// ignore_for_file: inference_failure_on_instance_creation, void_checks

import 'dart:developer';

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_type.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

part 'add_hadith_state.dart';

@injectable
class AddHadithCubit extends Cubit<AddHadithState> {
  AddHadithCubit() : super(const AddHadithState());

  void textOfHadithChanged(String value) => emit(state.copyWith(textOfHadith: Name.dirty(value)));

  void rawiOfHadithChanged(String value) => emit(state.copyWith(rawiOfHadith: value));

  void extractionOfHadithChanged(String value) => emit(state.copyWith(extractionOfHadith: value));

  void hadithAuthenticityChanged(HadithAuthenticity hadithAuthenticity) =>
      emit(state.copyWith(hadithAuthenticity: hadithAuthenticity));

  void hadithExplainChanged(String value) => emit(state.copyWith(hadithExplain: value));

  void sliderPriorityChanged(double value) {
    emit(state.copyWith(sliderValue: value));
  }

  Future<void> saveDaleelForm() async {
    emit(state.copyWith(status: const Loading()));
    try {
      await getIt.get<DaleelRepository>().saveDaleelInfoRemote(
        daleelType: DaleelType.hadith,
        daleelId: const Uuid().v4(),
        text: state.textOfHadith.value,
        rawi: state.rawiOfHadith,
        extraction: state.extractionOfHadith,
        hadithAuthenticity: state.hadithAuthenticity,
        lastRevisedAt: DateTime.now(),
        priority: Priority.normal,
        tags: [],
      );
      emit(state.copyWith(status: const Success('Saved Daleel Successfully')));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: Failure(e as GenericException)));
    }
  }
}

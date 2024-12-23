// ignore_for_file: inference_failure_on_instance_creation

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/features/add_hadith/features/add_hadith/domain/models/hadith_type.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'add_hadith_state.dart';

class AddHadithCubit extends Cubit<AddHadithState> {
  AddHadithCubit() : super(const AddHadithState());

  void textOfHadithChanged(String value) => emit(state.copyWith(textOfHadith: Name.dirty(value)));

  void isnadOfHadithChanged(String value) => emit(state.copyWith(isnadOfHadith: value));

  void sourceOfHadithChanged(String value) => emit(state.copyWith(sourceOfHadith: value));

  void hadithTypeChanged(HadithType hadithType) => emit(state.copyWith(hadithType: hadithType));

  void hadithExplainChanged(String value) => emit(state.copyWith(hadithExplain: value));

  Future<void> saveHadithForm() async {
    emit(state.copyWith(status: const Loading()));
    // implementation used to store form data here --->
  }
}

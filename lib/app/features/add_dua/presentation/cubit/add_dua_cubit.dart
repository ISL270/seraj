import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/duas/data/model/dua.dart';
import 'package:athar/app/features/duas/domain/dua_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

part 'add_dua_state.dart';

@singleton
class AddDuaCubit extends Cubit<AddDuaState> {
  AddDuaCubit(this._duaRepository) : super(const AddDuaState());

  final DuaRepository _duaRepository;

  void textOfDuaChanged(String value) =>
      emit(state.copyWith(textOfDua: Name.dirty(value)));

  void typeOfDuaChanged(String value) =>
      emit(state.copyWith(typeOfDua: Name.dirty(value)));

  void numOfRepeatChanged(String value) =>
      emit(state.copyWith(numOfRepeat: Name.dirty(value)));

  void duaTimeChanged(String value) =>
      emit(state.copyWith(duaTime: Name.dirty(value)));

  void duaNotesChanged(String value) => emit(state.copyWith(duaNotes: value));

  Future<void> saveDuaForm() async {
    emit(state.copyWith(status: const Loading()));
    try {
      await _duaRepository.saveDua(
        dua: Dua(
          textOfDua: state.textOfDua.value,
          typeOfDua: state.typeOfDua.value,
          numOfRepeat: state.numOfRepeat.value,
          timeOfDua: state.duaTime.value,
          duaNotes: state.duaNotes,
        ),
      );
      emit(state.copyWith(status: const Success('Saved Aya Successfully')));
    } catch (e) {
      print(e.toString());
      emit(state.copyWith(status: Failure(e as GenericException)));
    }
  }
}

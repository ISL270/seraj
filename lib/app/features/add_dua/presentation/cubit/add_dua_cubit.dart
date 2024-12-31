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

  void rewardOfDuaChanged(String value) =>
      emit(state.copyWith(reward: Name.dirty(value)));

  void numOfRepeatChanged(String value) =>
      emit(state.copyWith(numOfRepeat: Name.dirty(value)));

  void priorityChanged(String value) => emit(state.copyWith(priority: value));

  void duaExplanationChanged(String value) =>
      emit(state.copyWith(explanation: value));

  Future<void> saveDuaForm() async {
    emit(state.copyWith(status: const Loading()));
    try {
      await _duaRepository.saveDua(
        dua: Dua(
          textOfDua: state.textOfDua.value,
          explanation: state.explanation,
          numOfRepeat: state.numOfRepeat.value,
          priority: state.priority,
          reward: state.reward.value,
        ),
      );
      emit(state.copyWith(status: const Success('Saved Aya Successfully')));
    } catch (e) {
      print(e.toString());
      emit(state.copyWith(status: Failure(e as GenericException)));
    }
  }
}

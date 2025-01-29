import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/dua/domain/dua_repository.dart';
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

  void duaChanged(String value) => emit(state.copyWith(dua: Name.dirty(value)));

  void rewardOfDuaChanged(String value) => emit(state.copyWith(reward: Name.dirty(value)));

  void sliderPriorityChanged(double value) {
    emit(state.copyWith(sliderValue: value));
  }

  void priorityChanged(Priority value) => emit(state.copyWith(priority: value));

  void duaExplanationChanged(String value) => emit(state.copyWith(description: value));

  void saveDuaForm() => _duaRepository.addDua(
        tags: state.tags,
        text: state.dua.value,
        reward: state.reward.value,
        description: state.description,
      );
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_dua_state.dart';

class AddDuaCubit extends Cubit<AddDuaState> {
  AddDuaCubit() : super(AddDuaInitial());
}

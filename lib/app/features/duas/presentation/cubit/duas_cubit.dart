import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'duas_state.dart';

class DuasCubit extends Cubit<DuasState> {
  DuasCubit() : super(DuasInitial());
}

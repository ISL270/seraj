import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'daleel_revision_state.dart';

class DaleelRevisionCubit extends Cubit<DaleelRevisionState> {
  DaleelRevisionCubit() : super(DaleelRevisionInitial());
}

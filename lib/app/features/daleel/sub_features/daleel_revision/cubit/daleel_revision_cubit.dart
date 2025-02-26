import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:athar/app/features/daleel/sub_features/daleel_revision/cubit/daleel_revision_state.dart';
import 'package:bloc/bloc.dart';

class DaleelRevisionCubit extends Cubit<DaleelRevisionState> {
  final DaleelRepository _repository;
  DaleelRevisionCubit(this._repository) : super(const DaleelRevisionState());
}

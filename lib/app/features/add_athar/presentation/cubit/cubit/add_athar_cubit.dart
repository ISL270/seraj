import 'package:athar/app/features/add_athar/presentation/cubit/cubit/add_athar_state.dart';
import 'package:bloc/bloc.dart';

class AddAtharCubit extends Cubit<AddAtharState> {
  AddAtharCubit() : super(AddAtharState());

  void selectIndexChanged(int index) => emit(AddAtharState(selectRule: index));
}

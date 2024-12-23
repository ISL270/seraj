import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_hadith_state.dart';

class AddHadithCubit extends Cubit<AddHadithState> {
  AddHadithCubit() : super(AddHadithInitial());
}

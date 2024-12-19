import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarInitial());
}

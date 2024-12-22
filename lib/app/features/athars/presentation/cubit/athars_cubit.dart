import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'athars_state.dart';

class AtharsCubit extends Cubit<AtharsState> {
  AtharsCubit() : super(AtharsInitial());

  void ensureCubit() {
    log('شغااااال');
  }
}

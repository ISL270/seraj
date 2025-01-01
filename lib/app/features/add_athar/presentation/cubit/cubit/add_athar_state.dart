// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

final class AddAtharState extends Equatable {
  AddAtharState({
    this.selectRule = 0,
  });

  int selectRule;

  AddAtharState copyWith({
    int? selectRule,
  }) {
    return AddAtharState(
      selectRule: selectRule ?? this.selectRule,
    );
  }

  @override
  List<Object> get props => [selectRule];
}

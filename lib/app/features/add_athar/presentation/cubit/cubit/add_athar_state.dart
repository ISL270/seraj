// ignore_for_file: must_be_immutable, strict_raw_type

import 'package:athar/app/core/enums/status.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

final class AddAtharState extends Equatable with FormzMixin {
  const AddAtharState({
    this.sliderValue = 0.0,
    this.athar = const Name.pure(),
    this.sayer = '',
    this.description = '',
    this.status = const Initial(),
  });

  final double sliderValue;
  final Name athar;
  final String sayer;
  final String description;
  final VoidStatus status;

  AddAtharState copyWith({
    double? sliderValue,
    Name? athar,
    String? sayer,
    String? description,
    VoidStatus? status,
  }) {
    return AddAtharState(
      sliderValue: sliderValue ?? this.sliderValue,
      athar: athar ?? this.athar,
      sayer: sayer ?? this.sayer,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [sliderValue, athar, sayer, description, status];

  @override
  @override
  List<FormzInput> get inputs => [athar];
}

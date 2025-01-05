// ignore_for_file: strict_raw_type

import 'package:athar/app/core/enums/status.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

final class AddOtherState extends Equatable with FormzMixin {
  const AddOtherState({
    this.other = const Name.pure(),
    this.sayer = '',
    this.description = '',
    this.sliderValue = 0,
    this.status = const Initial(),
  });

  final Name other;
  final String sayer;
  final String description;
  final double sliderValue;
  final VoidStatus status;

  AddOtherState copyWith({
    Name? other,
    String? sayer,
    String? description,
    double? sliderValue,
    VoidStatus? status,
  }) {
    return AddOtherState(
      other: other ?? this.other,
      sayer: sayer ?? this.sayer,
      description: description ?? this.description,
      sliderValue: sliderValue ?? this.sliderValue,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [other, sayer, description, sliderValue, status];

  @override
  List<FormzInput> get inputs => [other];

  String get errorMsg {
    if (!status.isFailure) return '';
    return (status as Failure).exception.message ?? 'unkown error';
  }
}

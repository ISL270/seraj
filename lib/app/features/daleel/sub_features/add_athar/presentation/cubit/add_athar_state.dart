// ignore_for_file: must_be_immutable, strict_raw_type

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/tag.dart';
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
    this.tags = const {},
  });

  final double sliderValue;
  final Name athar;
  final String sayer;
  final String description;
  final VoidStatus status;
  final Set<Tag> tags;

  AddAtharState copyWith({
    double? sliderValue,
    Name? athar,
    String? sayer,
    String? description,
    VoidStatus? status,
    Set<Tag>? tags,
  }) {
    return AddAtharState(
        sliderValue: sliderValue ?? this.sliderValue,
        athar: athar ?? this.athar,
        sayer: sayer ?? this.sayer,
        description: description ?? this.description,
        status: status ?? this.status,
        tags: tags ?? this.tags);
  }

  @override
  List<Object> get props => [
        sliderValue,
        tags,
        athar,
        sayer,
        description,
        status,
      ];

  @override
  @override
  List<FormzInput> get inputs => [athar];

  String get errorMsg {
    if (!status.isFailure) return '';
    return (status as Failure).exception.message ?? 'unkown error';
  }
}

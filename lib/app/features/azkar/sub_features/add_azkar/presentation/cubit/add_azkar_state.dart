// ignore_for_file: strict_raw_type, override_on_non_overriding_member

part of 'add_azkar_cubit.dart';

final class AddAzkarState extends Equatable with FormzMixin {
  const AddAzkarState({
    this.text = const Name.pure(),
    this.explanation = '',
    this.noOfRepeats = 1,
    this.status = const Initial(),
  });

  final Name text;
  final String explanation;

  final int noOfRepeats;
  final VoidStatus status;

  @override
  List<Object> get props => [text, explanation, noOfRepeats, status];

  AddAzkarState copyWith({
    Name? text,
    String? explanation,
    int? noOfRepeats,
    VoidStatus? status,
  }) {
    return AddAzkarState(
      text: text ?? this.text,
      explanation: explanation ?? this.explanation,
      noOfRepeats: noOfRepeats ?? this.noOfRepeats,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput> get inputs => [text];

  String get errorMsg {
    if (!status.isFailure) return '';
    return (status as Failure).exception.message ?? 'unkown error';
  }
}

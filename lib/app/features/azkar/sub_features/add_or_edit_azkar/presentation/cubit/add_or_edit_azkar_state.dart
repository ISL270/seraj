// ignore_for_file: strict_raw_type, override_on_non_overriding_member

part of 'add_or_edit_azkar_cubit.dart';

final class AddOrEditAzkarState extends Equatable with FormzMixin {
  const AddOrEditAzkarState({
    this.azkarId,
    this.tags = const {},
    this.text = const Name.pure(),
    this.explanation = '',
    this.noOfRepeats = 1,
    this.status = const Initial(),
  });

  final int? azkarId;
  final Set<Tag> tags;

  final Name text;
  final String explanation;

  final int noOfRepeats;
  final VoidStatus status;

  @override
  List<Object> get props => [text, explanation, noOfRepeats, tags, status];

  AddOrEditAzkarState copyWith({
    int? azkarId,
    Name? text,
    String? explanation,
    int? noOfRepeats,
    Set<Tag>? tags,
    VoidStatus? status,
  }) {
    return AddOrEditAzkarState(
      azkarId: azkarId ?? this.azkarId,
      text: text ?? this.text,
      explanation: explanation ?? this.explanation,
      noOfRepeats: noOfRepeats ?? this.noOfRepeats,
      tags: tags ?? this.tags,
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

// ignore_for_file: strict_raw_type

part of 'add_aya_cubit.dart';

final class AddAyaState extends Equatable with FormzMixin {
  const AddAyaState({
    this.textOfAya = const Name.pure(),
    this.surahOfAya = const Name.pure(),
    this.ayaExplain = const Name.pure(),
    this.numOfAya = '',
    this.status = const Initial(),
    this.tags = const [],
    this.hintTexts = const [],
  });

  final List<String> hintTexts;

  final Name textOfAya;
  final Name surahOfAya;
  final Name ayaExplain;
  final String numOfAya;
  final List<String> tags;
  final VoidStatus status;

  @override
  List<Object> get props => [
        ayaExplain,
        tags,
        status,
      ];

  AddAyaState copyWith({
    Name? textOfAya,
    Name? ayaExplain,
    Name? surahOfAya,
    String? numOfAya,
    List<String>? tags,
    VoidStatus? status,
  }) {
    return AddAyaState(
      textOfAya: textOfAya ?? this.textOfAya,
      ayaExplain: ayaExplain ?? this.ayaExplain,
      surahOfAya: surahOfAya ?? this.surahOfAya,
      numOfAya: numOfAya ?? this.numOfAya,
      status: status ?? this.status,
      tags: tags ?? this.tags,
    );
  }

  @override
  // ignore: override_on_non_overriding_member
  List<FormzInput> get inputs => [ayaExplain];

  String get errorMsg {
    if (!status.isFailure) return '';
    return (status as Failure).exception.message ?? 'unkown error';
  }
}

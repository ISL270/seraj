// ignore_for_file: strict_raw_type

part of 'add_edit_hadith_cubit.dart';

final class AddOrEditHadithState extends Equatable with FormzMixin {
  const AddOrEditHadithState({
    this.hadithId,
    this.authenticity,
    this.hadith = const Name.pure(),
    this.sayer = '',
    this.extraction = '',
    this.description = '',
    this.sliderValue = 0.0,
    this.status = const Initial(),
    this.tags = const {},
  });

  final int? hadithId;
  final Name hadith;
  final HadithAuthenticity? authenticity;
  final String sayer;
  final String extraction;
  final String description;
  final double sliderValue;
  final VoidStatus status;
  final Set<Tag> tags;

  @override
  List<Object?> get props => [
        hadithId,
        hadith,
        authenticity,
        tags,
        sayer,
        extraction,
        description,
        sliderValue,
        status,
      ];

  AddOrEditHadithState copyWith({
    int? hadithId,
    Name? hadith,
    HadithAuthenticity? authenticity,
    String? sayer,
    String? extraction,
    String? description,
    double? sliderValue,
    Set<Tag>? tags,
    VoidStatus? status,
  }) {
    return AddOrEditHadithState(
      hadithId: hadithId ?? this.hadithId,
      hadith: hadith ?? this.hadith,
      authenticity: authenticity ?? this.authenticity,
      sayer: sayer ?? this.sayer,
      extraction: extraction ?? this.extraction,
      description: description ?? this.description,
      sliderValue: sliderValue ?? this.sliderValue,
      status: status ?? this.status,
      tags: tags ?? this.tags,
    );
  }

  @override
  List<FormzInput> get inputs => [hadith];

  String get errorMsg {
    if (!status.isFailure) return '';
    return (status as Failure).exception.message ?? 'unkown error';
  }
}

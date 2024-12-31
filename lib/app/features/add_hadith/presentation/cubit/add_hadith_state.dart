// ignore_for_file: strict_raw_type

part of 'add_hadith_cubit.dart';

final class AddHadithState extends Equatable with FormzMixin {
  const AddHadithState({
    this.hadithAuthenticity,
    this.textOfHadith = const Name.pure(),
    this.sayerOfHadith = '',
    this.extractionOfHadith = '',
    this.descOfHadith = '',
    this.sliderValue = 0.0,
    this.status = const Initial(),
  });

  final Name textOfHadith;
  final HadithAuthenticity? hadithAuthenticity;
  final String sayerOfHadith;
  final String extractionOfHadith;
  final String descOfHadith;
  final double sliderValue;
  final VoidStatus status;

  @override
  List<Object> get props => [
        textOfHadith,
        hadithAuthenticity ?? HadithAuthenticity,
        sayerOfHadith,
        extractionOfHadith,
        descOfHadith,
        sliderValue,
        status,
      ];

  AddHadithState copyWith({
    Name? textOfHadith,
    String? sayerOfHadith,
    String? extractionOfHadith,
    HadithAuthenticity? hadithAuthenticity,
    String? descOfHadith,
    double? sliderValue,
    VoidStatus? status,
  }) {
    return AddHadithState(
      textOfHadith: textOfHadith ?? this.textOfHadith,
      sayerOfHadith: sayerOfHadith ?? this.sayerOfHadith,
      extractionOfHadith: extractionOfHadith ?? this.extractionOfHadith,
      hadithAuthenticity: hadithAuthenticity ?? this.hadithAuthenticity,
      descOfHadith: descOfHadith ?? this.descOfHadith,
      sliderValue: sliderValue ?? this.sliderValue,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput> get inputs => [
        textOfHadith,
      ];

  String get errorMsg {
    if (!status.isFailure) return '';
    return (status as Failure).exception.message ?? 'unkown error';
  }
}

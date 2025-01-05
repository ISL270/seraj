// ignore_for_file: strict_raw_type

part of 'add_aya_cubit.dart';

final class AddAyaState extends Equatable with FormzMixin {
  const AddAyaState({
    this.textOfAya = const Name.pure(),
    this.surahOfAya = const Name.pure(),
    this.ayaExplain = const Name.pure(),
    this.firstAya = 0,
    this.lastAya = 0,
    this.status = const Initial(),
    this.tags = const [],
    this.query = '',
    this.hintTexts = const [],
    this.ayahs = const [],
    this.selectedAyahs = const [],
  });

  final List<Ayah> ayahs;
  final List<Ayah> selectedAyahs;
  final List<String> hintTexts;

  final Name textOfAya;
  final Name surahOfAya;
  final Name ayaExplain;
  final int firstAya;
  final int lastAya;
  final List<String> tags;
  final VoidStatus status;
  final String? query;

  @override
  List<Object> get props => [
        ayaExplain,
        tags,
        status,
        ayahs,
        selectedAyahs,
      ];

  AddAyaState copyWith({
    Name? textOfAya,
    Name? ayaExplain,
    Name? surahOfAya,
    String? numOfAya,
    String? query,
    List<Ayah>? ayahs,
    List<Ayah>? selectedAyahs,
    List<String>? tags,
    VoidStatus? status,
  }) {
    return AddAyaState(
      textOfAya: textOfAya ?? this.textOfAya,
      ayaExplain: ayaExplain ?? this.ayaExplain,
      surahOfAya: surahOfAya ?? this.surahOfAya,
      lastAya: lastAya,
      firstAya: firstAya,
      query: query ?? this.query,
      ayahs: ayahs ?? this.ayahs,
      selectedAyahs: selectedAyahs ?? this.selectedAyahs,
      status: status ?? this.status,
      tags: tags ?? this.tags,
    );
  }

  @override
  // ignore: override_on_non_overriding_member
  List<FormzInput> get inputs => [ayaExplain];
}

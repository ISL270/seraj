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
    this.tags = const {},
    this.query = '',
    this.ayaId,
    this.hintTexts = const [],
    this.ayahs = const [],
    this.selectedAyahs = const [],
  });

  final List<Ayah> ayahs;
  final List<Ayah> selectedAyahs;
  final List<String> hintTexts;
  final int? ayaId;
  final Name textOfAya;
  final Name surahOfAya;
  final Name ayaExplain;
  final int firstAya;
  final int lastAya;
  final Set<Tag> tags;
  final VoidStatus status;
  final String? query;

  @override
  List<Object?> get props => [
        ayaId,
        textOfAya,
        ayaExplain,
        tags,
        firstAya,
        lastAya,
        status,
        ayahs,
        selectedAyahs,
      ];

  AddAyaState copyWith({
    int? ayaId,
    Name? textOfAya,
    Name? ayaExplain,
    Name? surahOfAya,
    int? firstAya,
    int? lastAya,
    String? query,
    List<Ayah>? ayahs,
    List<Ayah>? selectedAyahs,
    Set<Tag>? tags,
    VoidStatus? status,
  }) {
    return AddAyaState(
      ayaId: ayaId ?? this.ayaId,
      textOfAya: textOfAya ?? this.textOfAya,
      ayaExplain: ayaExplain ?? this.ayaExplain,
      surahOfAya: surahOfAya ?? this.surahOfAya,
      lastAya: lastAya ?? this.lastAya,
      firstAya: firstAya ?? this.firstAya,
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

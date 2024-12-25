import 'package:equatable/equatable.dart';

final class AyaModel extends Equatable {
  final String? id;
  final String textOfAya;
  final String? ayaExplain;
  final String surahOfAya;
  final String nomOfAya;

  const AyaModel({
    required this.textOfAya,
    required this.surahOfAya,
    required this.nomOfAya,
    this.id,
    this.ayaExplain,
  });

  @override
  List<Object?> get props => [
        id,
        textOfAya,
        ayaExplain,
        nomOfAya,
        surahOfAya,
      ];
}

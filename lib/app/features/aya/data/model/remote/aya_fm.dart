import 'package:athar/app/core/firestore/remote_model.dart';
import 'package:athar/app/features/aya/domain/models/aya_model.dart';

final class AyaFm implements RemoteModel<AyaModel> {
  final String textOfAya;
  final String surahOfAya;
  final String nomOfAya;
  final String? ayaExplain;

  AyaFm({
    required this.textOfAya,
    required this.surahOfAya,
    required this.nomOfAya,
    this.ayaExplain,
  });

  factory AyaFm.fromJson(String docId, Map<String, dynamic> json) => AyaFm(
        textOfAya: json['textOfAya'] as String,
        ayaExplain: json['ayaExplain'] as String,
        surahOfAya: json['surahOfAya'] as String,
        nomOfAya: json['nomOfAya'] as String,
      );

  @override
  AyaModel toDomain() => AyaModel(
        textOfAya: textOfAya,
        surahOfAya: surahOfAya,
        nomOfAya: nomOfAya,
      );
}

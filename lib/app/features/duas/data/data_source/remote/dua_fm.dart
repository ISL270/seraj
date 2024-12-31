part of 'dua_firestore_source.dart';

final class DuaFm implements RemoteModel<Dua> {
  final String textOfDua;
  final String typeOfDua;
  final String numOfRepeat;
  final String timeOfDua;
  final String? duaNotes;

  DuaFm({
    required this.textOfDua,
    required this.typeOfDua,
    required this.numOfRepeat,
    required this.timeOfDua,
    this.duaNotes,
  });

  factory DuaFm.fromJson(String docId, Map<String, dynamic> json) => DuaFm(
        textOfDua: json['textOfDua'] as String,
        typeOfDua: json['typeOfDua'] as String,
        numOfRepeat: json['numOfRepeat'] as String,
        timeOfDua: json['timeOfDua'] as String,
        duaNotes: json['duaNotes'] as String,
      );

  @override
  Dua toDomain() => Dua(
        textOfDua: textOfDua,
        typeOfDua: typeOfDua,
        numOfRepeat: numOfRepeat,
        timeOfDua: timeOfDua,
        duaNotes: duaNotes,
      );
}

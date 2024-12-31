part of 'dua_firestore_source.dart';

final class DuaFm implements RemoteModel<Dua> {
  final String textOfDua;
  final String? reward;
  final String? numOfRepeat;
  final String? priority;
  final String? explanation;

  DuaFm({
    required this.textOfDua,
    required this.reward,
    required this.numOfRepeat,
    required this.priority,
    this.explanation,
  });

  factory DuaFm.fromJson(String docId, Map<String, dynamic> json) => DuaFm(
        textOfDua: json['textOfDua'] as String,
        reward: json['reward'] as String,
        numOfRepeat: json['numOfRepeat'] as String,
        priority: json['priority'] as String,
        explanation: json['explanation'] as String,
      );

  @override
  Dua toDomain() => Dua(
        textOfDua: textOfDua,
        reward: reward,
        numOfRepeat: numOfRepeat,
        priority: priority,
        explanation: explanation,
      );
}

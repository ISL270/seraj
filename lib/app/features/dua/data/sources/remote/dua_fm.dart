part of 'dua_firestore_source.dart';

final class DuaFM implements RemoteModel<Dua> {
  @override
  final String id;
  final String text;
  final String? reward;
  final bool isFavourite;
  final List<String> tags;
  final String? description;

  const DuaFM({
    required this.id,
    required this.text,
    required this.tags,
    required this.reward,
    required this.isFavourite,
    required this.description,
  });

  factory DuaFM.fromJson(String docID, Map<String, dynamic> json) => DuaFM(
        id: docID,
        text: json['text'] as String,
        tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
        reward: json['reward'] as String?,
        isFavourite: json['isFavourite'] as bool,
        description: json['description'] as String?,
      );

  @override
  Dua toDomain() => Dua(
        id: id,
        text: text,
        tags: tags,
        reward: reward,
        isFavourite: isFavourite,
        description: description,
      );
}

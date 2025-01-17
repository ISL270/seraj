part of 'dua_firestore_source.dart';

@JsonSerializable(createToJson: false)
final class DuaFM implements RemoteModel<Dua> {
  final String id;
  final String text;
  final bool isFavorite;
  final String? reward;
  final List<String> tags;
  final String? description;

  const DuaFM({
    required this.id,
    required this.text,
    required this.tags,
    required this.isFavorite,
    required this.reward,
    required this.description,
  });

  factory DuaFM.fromJson(String docID, Map<String, dynamic> json) => _$DuaFMFromJson(docID, json);

  @override
  Dua toDomain() => Dua(
        isFavourite: isFavorite,
        id: id,
        text: text,
        tags: tags,
        reward: reward,
        description: description,
      );
}

part of 'dua_firestore_source.dart';

@JsonSerializable()
final class DuaFM implements RemoteModel<Dua> {
  final String id;
  final String text;
  final String? reward;
  final Priority priority;
  final List<String> tags;
  final String? description;

  const DuaFM({
    required this.id,
    required this.text,
    required this.priority,
    required this.tags,
    this.reward,
    this.description,
  });

  factory DuaFM.fromJson(String docID, Map<String, dynamic> json) =>
      _$DuaFMFromJson(docID, json);

  Map<String, dynamic> toJson() => _$DuaFMToJson(this);

  @override
  Dua toDomain() => Dua(
        id: id,
        text: text,
        tags: tags,
        reward: reward,
        priority: priority,
        description: description,
      );
}

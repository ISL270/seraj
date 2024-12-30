import 'package:athar/app/features/daleel/data/models/remote/daleel_info_rm.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_type.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fire_daleel_info.g.dart';

sealed class FireDaleelInfo implements DaleelInfoRM {
  const FireDaleelInfo();

  factory FireDaleelInfo.fromJson(DaleelType daleelType, Map<String, dynamic> json) =>
      switch (daleelType) { DaleelType.hadith => FireHadithInfo.fromJson(json) };

  factory FireDaleelInfo.fromDaleelType(
    DaleelType daleelType, {
    required String id,
    required String text,
    required HadithAuthenticity hadithAuthenticity,
    required Priority priority,
    required String extraction,
    required DateTime lastRevisedAt,
    required List<String> tags,
    required String rawi,
  }) =>
      switch (daleelType) {
        DaleelType.hadith => FireHadithInfo(
            id: id,
            text: text,
            authenticity: hadithAuthenticity,
            priority: priority,
            extraction: extraction,
            tags: tags,
            daleelType: daleelType,
            rawi: rawi,
            lastRevisedAt: lastRevisedAt,
          ),
      };

  @override
  DaleelInfoRM fromDomain(Daleel daleel) => switch (daleel) {
        Hadith() => FireHadithInfo(
            id: daleel.id,
            text: daleel.text,
            authenticity: daleel.authenticity!,
            priority: daleel.priotiy,
            extraction: daleel.extraction,
            tags: daleel.tags,
            daleelType: DaleelType.hadith,
            rawi: daleel.rawi,
            lastRevisedAt: daleel.lastRevisedAt!,
          )
      };
}

@JsonSerializable(explicitToJson: true)
final class FireHadithInfo extends FireDaleelInfo {
  final String? rawi;
  final String? extraction;
  final HadithAuthenticity? authenticity;

  @override
  String id;

  @override
  DaleelType daleelType;

  @override
  Priority priority;

  @override
  String text;

  @override
  List<String> tags;

  @override
  DateTime lastRevisedAt;

  FireHadithInfo({
    required this.id,
    required this.text,
    required this.authenticity,
    required this.priority,
    required this.daleelType,
    required this.rawi,
    required this.extraction,
    required this.tags,
    required this.lastRevisedAt,
  });

  factory FireHadithInfo.fromJson(Map<String, dynamic> json) => _$FireHadithInfoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FireHadithInfoToJson(this);

  @override
  Daleel toDomain() => Hadith(
        id: id,
        text: text,
        priotiy: priority,
        authenticity: authenticity,
        extraction: extraction,
        rawi: rawi,
        tags: tags,
        lastRevisedAt: lastRevisedAt,
      );
}

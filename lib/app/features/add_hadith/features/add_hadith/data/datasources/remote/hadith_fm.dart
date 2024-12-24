part of 'hadith_firestore_source.dart';

final class HadithFM implements RemoteModel<HadithModel> {
  final String id;
  final String textOfHadith;
  final HadithType hadithType;
  final String? isnadOfHadith;
  final String? sourceOfHadith;
  final String? hadithExplain;

  HadithFM({
    required this.id,
    required this.textOfHadith,
    required this.hadithType,
    this.isnadOfHadith,
    this.sourceOfHadith,
    this.hadithExplain,
  });

  factory HadithFM.fromJson(String docId, Map<String, dynamic> json) => HadithFM(
        id: docId,
        textOfHadith: json['textOfHadith'] as String,
        hadithType: json['hadithType'] as HadithType,
        isnadOfHadith: json['isnadOfHadith'] as String,
        sourceOfHadith: json['sourceOfHadith'] as String,
        hadithExplain: json['hadithExplain'] as String,
      );

  @override
  HadithModel toDomain() => HadithModel(
        id: id,
        textOfHadith: textOfHadith,
        hadithType: hadithType,
        isnadOfHadith: isnadOfHadith,
        sourceOfHadith: sourceOfHadith,
        hadithExplain: hadithExplain,
      );
}

import 'package:athar/app/features/add_hadith/features/add_hadith/domain/models/hadith_type.dart';
import 'package:equatable/equatable.dart';

final class HadithModel extends Equatable {
  final String id;
  final String textOfHadith;
  final HadithType hadithType;
  final String? isnadOfHadith;
  final String? sourceOfHadith;
  final String? hadithExplain;

  const HadithModel({
    required this.id,
    required this.textOfHadith,
    required this.hadithType,
    this.isnadOfHadith,
    this.sourceOfHadith,
    this.hadithExplain,
  });

  @override
  List<Object?> get props => [
        id,
        textOfHadith,
        hadithType,
        isnadOfHadith,
        sourceOfHadith,
        hadithExplain,
      ];
}

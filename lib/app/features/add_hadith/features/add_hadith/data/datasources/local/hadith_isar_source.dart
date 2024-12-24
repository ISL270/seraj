import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/features/add_hadith/features/add_hadith/data/datasources/local/hadith_isar.dart';
import 'package:athar/app/features/add_hadith/features/add_hadith/data/models/hadith_model.dart';
import 'package:injectable/injectable.dart';

@singleton
final class HadithIsarSource extends IsarSource<HadithModel, HadithIsar> {
  HadithIsarSource(super.isarService);

  @override
  HadithIsar fromDomain(HadithModel dm) => HadithIsar.fromDomain(dm);

  Future<int> putHadith(HadithIsar hadith) => isarService.put<HadithIsar>(hadith);
}

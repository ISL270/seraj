import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/features/aya/data/sources/local/aya_isar.dart';
import 'package:athar/app/features/aya/domain/models/aya_model.dart';
import 'package:injectable/injectable.dart';

@singleton
final class AyaIsarSource extends IsarSource<AyaModel, AyaIsar> {
  AyaIsarSource(super.isarService);

  @override
  AyaIsar fromDomain(AyaModel dm) => AyaIsar.fromDomain(dm);

  Future<int> putAya(AyaIsar aya) => isarService.put<AyaIsar>(aya);
}

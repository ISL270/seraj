import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';

abstract interface class DaleelInfoRM {
  final DaleelType daleelType;
  final String id;
  final String text;
  final Priority priority;
  final List<String> tags;
  final DateTime lastRevisedAt;

  DaleelInfoRM({
    required this.daleelType,
    required this.id,
    required this.text,
    required this.priority,
    required this.lastRevisedAt,
    this.tags = const [],
  });

  Daleel toDomain();

  DaleelInfoRM fromDomain(Daleel daleel);

  Map<String, dynamic> toJson();
}

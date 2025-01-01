import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:equatable/equatable.dart';

final class Dua extends Equatable {
  final String id;
  final String dua;
  final String? reward;
  final Priority priority;
  final List<String> tags;
  final String? description;

  const Dua({
    required this.id,
    required this.dua,
    required this.priority,
    this.reward,
    this.description,
    this.tags = const [],
  });

  @override
  List<Object?> get props => [
        id,
        dua,
        tags,
        reward,
        priority,
        description,
      ];
}

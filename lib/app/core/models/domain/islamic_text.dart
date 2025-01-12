import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:equatable/equatable.dart';

abstract base class IslamicText extends Equatable {
  final String id;
  final String text;
  final Priority priority;
  final List<String> tags;
  final String? description;

  const IslamicText({
    required this.id,
    required this.text,
    this.description,
    this.tags = const [],
    this.priority = Priority.normal,
  });

  @override
  List<Object?> get props => [
        id,
        text,
        tags,
        priority,
        description,
      ];
}

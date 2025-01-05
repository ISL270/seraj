import 'package:athar/app/features/daleel/domain/models/priority.dart';

abstract base class IslamicText {
  final String id;
  final String text;
  final String? description;
  final Priority priority;
  final List<String> tags;

  const IslamicText({
    required this.id,
    required this.text,
    this.priority = Priority.normal,
    this.tags = const [],
    this.description,
  });
}

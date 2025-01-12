import 'package:equatable/equatable.dart';

abstract base class IslamicText extends Equatable {
  final String id;
  final String text;
  final List<String> tags;
  final String? description;

  const IslamicText({
    required this.id,
    required this.text,
    this.description,
    this.tags = const [],
  });

  @override
  List<Object?> get props => [
        id,
        text,
        tags,
        description,
      ];
}

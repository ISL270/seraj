import 'package:equatable/equatable.dart';

abstract base class IslamicText extends Equatable {
  final int? id;
  final String text;
  final List<String> tags;
  final String? description;

  const IslamicText({
    required this.text,
    this.id,
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

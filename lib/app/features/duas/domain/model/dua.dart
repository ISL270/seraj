import 'package:athar/app/core/models/domain/islamic_text.dart';
import 'package:equatable/equatable.dart';

final class Dua extends IslamicText with EquatableMixin {
  final String? reward;

  const Dua({
    required super.id,
    required super.text,
    super.priority,
    this.reward,
    super.description,
    super.tags,
  });

  @override
  List<Object?> get props => [
        id,
        text,
        tags,
        reward,
        priority,
        description,
      ];
}

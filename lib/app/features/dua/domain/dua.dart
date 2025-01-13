import 'package:athar/app/core/models/domain/islamic_text.dart';
import 'package:equatable/equatable.dart';

final class Dua extends IslamicText with EquatableMixin {
  final String? reward;
  final bool isFavorite;

  const Dua({
    required super.id,
    required super.text,
    required this.isFavorite,
    super.tags,
    this.reward,
    super.description,
  });

  @override
  List<Object?> get props => [super.props, reward];
}

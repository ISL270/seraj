import 'package:athar/app/core/models/domain/islamic_text.dart';
import 'package:equatable/equatable.dart';

final class Dua extends IslamicText with EquatableMixin {
  final String? reward;

  const Dua({
    required super.id,
    required super.text,
    super.tags,
    this.reward,
    super.description,
  });

  @override
  List<Object?> get props => [super.props, reward];
}

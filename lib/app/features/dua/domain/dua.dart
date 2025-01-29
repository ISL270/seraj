import 'package:athar/app/core/models/islamic_text.dart';
import 'package:equatable/equatable.dart';

final class Dua extends IslamicText with EquatableMixin {
  final String? reward;
  final bool isFavourite;

  const Dua({
    required super.text,
    this.isFavourite = false,
    super.id,
    super.tags,
    this.reward,
    super.description,
  });

  @override
  List<Object?> get props => [super.props, reward, isFavourite];
}

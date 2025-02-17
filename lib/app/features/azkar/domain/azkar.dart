import 'package:athar/app/core/models/islamic_text.dart';
import 'package:equatable/equatable.dart';

final class Azkar extends IslamicText with EquatableMixin {
  final int noOfRepetitions;
  final bool isFavourite;

  const Azkar({
    required super.id,
    required super.text,
    this.isFavourite = false,
    super.description,
    super.tags,
    this.noOfRepetitions = 1,
  });

  @override
  List<Object?> get props => [super.props, description, tags, noOfRepetitions, isFavourite];
}

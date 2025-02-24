import 'package:athar/app/core/models/tag.dart';
import 'package:equatable/equatable.dart';

final class AzkarFilters with EquatableMixin {
  final Set<bool> favourites = {};
  final Set<Tag> tags = {};

  bool get isEmpty => favourites.isEmpty && tags.isEmpty;

  @override
  List<Object?> get props => [favourites, tags];

  AzkarFilters clone() {
    return AzkarFilters()
      ..favourites.addAll(favourites)
      ..tags.addAll(tags);
  }
}

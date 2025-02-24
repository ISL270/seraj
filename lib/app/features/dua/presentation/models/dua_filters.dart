import 'package:athar/app/core/models/tag.dart';
import 'package:equatable/equatable.dart';

final class DuaFilters with EquatableMixin {
  final Set<bool> favourites = {};
  final Set<Tag> tags = {};

  bool get isEmpty => favourites.isEmpty && tags.isEmpty;

  @override
  List<Object?> get props => [favourites, tags];

  DuaFilters clone() {
    return DuaFilters()
      ..favourites.addAll(favourites)
      ..tags.addAll(tags);
  }
}

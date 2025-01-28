import 'package:equatable/equatable.dart';

final class FavouriteFilters with EquatableMixin {
  final Set<bool> favourites = {};

  bool get isEmpty => favourites.isEmpty;

  @override
  List<Object?> get props => [favourites];

  FavouriteFilters clone() {
    return FavouriteFilters()..favourites.addAll(favourites);
  }
}

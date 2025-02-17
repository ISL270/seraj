import 'package:equatable/equatable.dart';

final class AzkarFilters with EquatableMixin {
  final Set<bool> favourites = {};

  bool get isEmpty => favourites.isEmpty;

  @override
  List<Object?> get props => [favourites];

  AzkarFilters clone() {
    return AzkarFilters()..favourites.addAll(favourites);
  }
}

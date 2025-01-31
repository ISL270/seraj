// ignore_for_file: unused_element, must_be_immutable

part of 'azkar_bloc.dart';

sealed class AzkarEvent extends Equatable {
  const AzkarEvent();

  @override
  List<Object> get props => [];
}

final class AzkarSearched extends AzkarEvent {
  final String searchTerm;

  const AzkarSearched(this.searchTerm);

  @override
  List<Object> get props => [searchTerm];
}

final class AzkarSubscriptionRequested extends AzkarEvent {}

final class AzkarNextPageFetched extends AzkarEvent {}

// final class _AzkarFavourited extends AzkarEvent {
//   Azkar azkar;

//   _AzkarFavourited(this.azkar);
// }

final class AzkarFiltered extends AzkarEvent {
  final AzkarFilters filters;

  const AzkarFiltered(this.filters);
}

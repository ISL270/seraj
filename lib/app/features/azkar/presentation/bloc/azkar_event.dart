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

final class AzkarFavourited extends AzkarEvent {
  Azkar azkar;

  AzkarFavourited(this.azkar);
}

final class AzkarFiltered extends AzkarEvent {
  final AzkarFilters filters;

  const AzkarFiltered(this.filters);
}

final class AzkarDeleted extends AzkarEvent {
  final int id;

  const AzkarDeleted(this.id);
}

final class AzkarTagSearched extends AzkarEvent {
  final String query;

  const AzkarTagSearched(this.query);

  @override
  List<Object> get props => [query];
}

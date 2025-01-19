part of 'daleel_bloc.dart';

sealed class DaleelEvent extends Equatable {
  const DaleelEvent();

  @override
  List<Object> get props => [];
}

final class DaleelSubscriptionRequested extends DaleelEvent {}

final class DaleelSearched extends DaleelEvent {
  final String searchTerm;
  const DaleelSearched(this.searchTerm);

  @override
  List<Object> get props => [searchTerm];
}

final class DaleelNextPageFetched extends DaleelEvent {}

final class DaleelTypeFilterChanged extends DaleelEvent {
  final DaleelType daleelType;
  const DaleelTypeFilterChanged(this.daleelType);
}

final class DaleelPriorityFilterChanged extends DaleelEvent {
  final double priority;
  const DaleelPriorityFilterChanged(this.priority);
}

final class DaleelDateFilterChanged extends DaleelEvent {
  final DateTime date;
  const DaleelDateFilterChanged(this.date);
}

final class DaleelFiltered extends DaleelEvent {
  final DaleelFilters filters;
  const DaleelFiltered(this.filters);
}

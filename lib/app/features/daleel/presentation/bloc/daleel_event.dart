part of 'daleel_bloc.dart';

sealed class DaleelEvent extends Equatable {
  const DaleelEvent();

  @override
  List<Object> get props => [];
}

final class DaleelFetchData extends DaleelEvent {}

final class DaleelSearchFetched extends DaleelEvent {
  final String searchTerm;
  const DaleelSearchFetched(this.searchTerm);

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

// ignore_for_file: unused_element

part of 'azkar_bloc.dart';

final class AzkarState extends Equatable {
  final String searchTerm;
  final PaginatedResult<Azkar> azkars;
  final AzkarFilters azkarFilters;

  const AzkarState._({
    required this.searchTerm,
    required this.azkars,
    required this.azkarFilters,
  });

  AzkarState._initial()
      : this._(
          searchTerm: '',
          azkars: PaginatedResult.empty(),
          azkarFilters: AzkarFilters(),
        );

  AzkarState _copyWith({
    String? searchTerm,
    PaginatedResult<Azkar>? azkars,
    AzkarFilters? filters,
  }) =>
      AzkarState._(
        searchTerm: searchTerm ?? this.searchTerm,
        azkars: azkars ?? this.azkars,
        azkarFilters: filters ?? azkarFilters,
      );

  @override
  List<Object> get props => [searchTerm, azkars, azkarFilters];
}

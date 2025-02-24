// ignore_for_file: unused_element

part of 'azkar_bloc.dart';

final class AzkarState extends Equatable {
  final String searchTerm;
  final PaginatedResult<Azkar> azkars;
  final AzkarFilters azkarFilters;
  final List<Tag> searchedTags;

  const AzkarState._({
    required this.searchTerm,
    required this.azkars,
    required this.azkarFilters,
    this.searchedTags = const [],
  });

  AzkarState._initial()
      : this._(
          searchTerm: '',
          azkars: PaginatedResult.empty(),
          azkarFilters: AzkarFilters(),
          searchedTags: const [],
        );

  AzkarState _copyWith({
    String? searchTerm,
    PaginatedResult<Azkar>? azkars,
    AzkarFilters? filters,
    List<Tag>? searchedTags,
  }) =>
      AzkarState._(
        searchTerm: searchTerm ?? this.searchTerm,
        azkars: azkars ?? this.azkars,
        azkarFilters: filters ?? azkarFilters,
        searchedTags: searchedTags ?? this.searchedTags,
      );

  @override
  List<Object> get props => [searchTerm, azkars, azkarFilters, searchedTags];
}

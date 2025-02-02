part of 'tags_cubit.dart';

class TagsState extends Equatable {
  final List<Tag> allTags;
  final List<Tag> filteredTags;
  final String searchQuery;

  const TagsState({
    this.allTags = const [],
    this.filteredTags = const [],
    this.searchQuery = '',
  });

  TagsState copyWith({
    List<Tag>? allTags,
    List<Tag>? filteredTags,
    String? searchQuery,
  }) {
    return TagsState(
      allTags: allTags ?? this.allTags,
      filteredTags: filteredTags ?? this.filteredTags,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object> get props => [allTags, filteredTags, searchQuery];
}

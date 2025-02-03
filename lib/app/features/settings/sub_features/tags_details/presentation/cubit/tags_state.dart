part of 'tags_cubit.dart';

class TagsState extends Equatable {
  final List<Tag> daleelTags;
  final List<Tag> duaTags;
  final List<Tag> filteredTags;
  final String searchQuery;

  const TagsState({
    this.duaTags = const [],
    this.daleelTags = const [],
    this.filteredTags = const [],
    this.searchQuery = '',
  });

  TagsState copyWith({
    List<Tag>? daleelTags,
    List<Tag>? duaTags,
    List<Tag>? filteredTags,
    String? searchQuery,
  }) {
    return TagsState(
      daleelTags: daleelTags ?? this.daleelTags,
      duaTags: duaTags ?? this.duaTags,
      filteredTags: filteredTags ?? this.filteredTags,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object> get props => [daleelTags, duaTags, filteredTags, searchQuery];
}

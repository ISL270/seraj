import 'package:athar/app/core/models/tag.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'tags_state.dart';

class TagsCubit extends Cubit<TagsState> {
  TagsCubit() : super(const TagsState()) {
    loadTags();
    searchCntrlr = TextEditingController();
  }

  late final TextEditingController searchCntrlr;

  void loadTags() {
    final tags = [
      const Tag(null, 'تبويبات السنة'),
      const Tag(null, 'تبويبات الفقه'),
      const Tag(null, 'تبويبات السيرة'),
    ];

    print('Loaded Tags: $tags'); // Debugging
    emit(state.copyWith(allTags: tags, filteredTags: tags));
  }

  void searchTags(String query) {
    final normalizedQuery = query.trim().toLowerCase();
    final filteredTags =
        state.allTags.where((tag) => tag.name.toLowerCase().contains(normalizedQuery)).toList();
    emit(state.copyWith(filteredTags: filteredTags, searchQuery: query));
  }

  void clearSearch() {
    searchCntrlr.clear();
    emit(state.copyWith(searchQuery: '', filteredTags: state.allTags));
  }

  @override
  Future<void> close() {
    searchCntrlr.dispose();
    return super.close();
  }
}

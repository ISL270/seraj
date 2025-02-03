import 'dart:developer';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/settings/sub_features/tags_details/domain/tags_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

part 'tags_state.dart';

@singleton
class TagsCubit extends Cubit<TagsState> {
  final TagsRepository _repository;
  late final TextEditingController searchController;

  TagsCubit(this._repository) : super(const TagsState()) {
    searchController = TextEditingController();
    loadTags(isDaleel: true);
  }

  void loadTags({required bool isDaleel}) {
    try {
      final tags = isDaleel ? _repository.getDaleelTags() : _repository.getDuaTags();
      emit(state.copyWith(
        daleelTags: isDaleel ? tags : state.daleelTags,
        duaTags: isDaleel ? state.duaTags : tags,
        filteredTags: tags,
        searchQuery: '',
      ));
    } catch (e) {
      log('Error fetching ${isDaleel ? 'Daleel' : 'Dua'} tags: $e');
    }
  }

  void searchTags(String query, {required bool isDaleel}) {
    final normalizedQuery = query.trim().toLowerCase();
    final sourceTags = isDaleel ? state.daleelTags : state.duaTags;
    final filteredTags =
        sourceTags.where((tag) => tag.name.toLowerCase().contains(normalizedQuery)).toList();

    emit(state.copyWith(filteredTags: filteredTags, searchQuery: query));
  }

  void clearSearch({required bool isDaleel}) {
    searchController.clear();
    emit(state.copyWith(
      searchQuery: '',
      filteredTags: isDaleel ? state.daleelTags : state.duaTags,
    ));
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}

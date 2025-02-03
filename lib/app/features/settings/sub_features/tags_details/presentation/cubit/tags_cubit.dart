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
  bool isDaleel = true; // Default to true (Daleel tags initially)

  TagsCubit(this._repository) : super(const TagsState()) {
    searchController = TextEditingController();
    loadTags(); // Load initial tags (Daleel by default)
  }

  void loadTags() {
    try {
      final tags = isDaleel ? _repository.getDaleelTags() : _repository.getDuaTags();
      emit(state.copyWith(
        daleelTags: isDaleel ? tags : state.daleelTags,
        duaTags: isDaleel ? state.duaTags : tags,
        filteredTags: tags,
        searchQuery: '',
      ));
    } catch (e) {
      log('Error fetching tags: $e');
    }
  }

  void switchTab(bool isDaleelTab) {
    isDaleel = isDaleelTab;
    loadTags(); // Reload tags based on the selected tab
  }

  void searchTags(String query) {
    final normalizedQuery = query.trim().toLowerCase();
    final sourceTags = isDaleel ? state.daleelTags : state.duaTags;
    final filteredTags =
        sourceTags.where((tag) => tag.name.toLowerCase().contains(normalizedQuery)).toList();
    emit(state.copyWith(filteredTags: filteredTags, searchQuery: query));
  }

  void clearSearch() {
    searchController.clear();
    loadTags();
  }

  void updateTags({required int id, required String newTag}) {
    try {
      if (isDaleel) {
        _repository.updateDaleelTags(id: id, newTag: newTag);
      } else {
        _repository.updateDuaTags(id: id, newTag: newTag);
      }
      loadTags(); // Reload the tags after update
    } catch (e) {
      log('Error updating tag: $e');
    }
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}

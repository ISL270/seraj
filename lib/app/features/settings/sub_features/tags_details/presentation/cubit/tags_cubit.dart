// ignore_for_file: omit_local_variable_types, prefer_final_locals

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
  bool isDaleel = true;
  int atharType = 0;

  TagsCubit(this._repository) : super(const TagsState()) {
    searchController = TextEditingController();
    loadTags(); // Load initial tags (Daleel by default)
  }

  void loadTags() {
    try {
      // final tags = isDaleel ? _repository.getDaleelTags() : _repository.getDuaTags();
      List<Tag> tags = switch (atharType) {
        0 => _repository.getDaleelTags(),
        1 => _repository.getDuaTags(),
        2 => _repository.getAzkarTags(),
        _ => [],
      };
      emit(state.copyWith(
        daleelTags: atharType == 0 ? tags : state.daleelTags,
        duaTags: atharType == 1 ? state.duaTags : tags,
        azkarTags: atharType == 2 ? state.azkarTags : tags,
        filteredTags: tags,
        searchQuery: '',
      ));
    } catch (e) {
      log('Error fetching tags: $e');
    }
  }

  void switchTab(int atharType) {
    this.atharType = atharType;
    loadTags(); // Reload tags based on the selected tab
  }

  void searchTags(String query) {
    final normalizedQuery = query.trim().toLowerCase();
    final sourceTags = atharType == 0
        ? state.daleelTags
        : atharType == 1
            ? state.duaTags
            : state.azkarTags;
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
      if (atharType == 0) {
        _repository.updateDaleelTags(id: id, newTag: newTag);
      } else if (atharType == 1) {
        _repository.updateDuaTags(id: id, newTag: newTag);
      } else {
        _repository.updateAzkarTags(id: id, newTag: newTag);
      }
      loadTags(); // Reload the tags after update
    } catch (e) {
      log('Error updating tag: $e');
    }
  }

  void deleteTag({required int id}) {
    try {
      if (atharType == 0) {
        _repository.deleteDaleelTag(id: id);
      } else if (atharType == 1) {
        _repository.deleteDuaTag(id: id);
      } else {
        _repository.deleteAzkarTag(id: id);
      }
      loadTags();
    } catch (e) {
      log('Error deleting tag: $e');
    }
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}

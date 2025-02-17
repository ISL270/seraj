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
    List<Tag> tags;

    switch (atharType) {
      case 0:
        tags = _repository.getDaleelTags();
      case 1:
        tags = _repository.getDuaTags();
      case 2:
        tags = _repository.getAzkarTags();
      default:
        tags = [];
    }

    emit(state.copyWith(
      daleelTags: atharType == 0 ? tags : state.daleelTags,
      duaTags: atharType == 1 ? tags : state.duaTags,
      azkarTags: atharType == 2 ? tags : state.azkarTags,
      filteredTags: tags, // Ensure filteredTags only contains tags for the active tab
    ));
  }

  void switchTab(int atharType) {
    this.atharType = atharType;
    loadTags(); // Reload tags based on the selected tab
  }

  void searchTags(String query) {
    List<Tag> relevantTags;

    switch (atharType) {
      case 0:
        relevantTags = state.daleelTags;
      case 1:
        relevantTags = state.duaTags;
      case 2:
        relevantTags = state.azkarTags;
      default:
        relevantTags = [];
    }

    final filtered =
        relevantTags.where((tag) => tag.name.toLowerCase().contains(query.toLowerCase())).toList();

    emit(state.copyWith(filteredTags: filtered, searchQuery: query));
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

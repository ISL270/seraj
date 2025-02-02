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
  late final TextEditingController searchCntrlr;

  TagsCubit(this._repository) : super(const TagsState()) {
    searchCntrlr = TextEditingController();
    loadTags();
  }

  void loadTags() {
    try {
      final tags = _repository.getAllTags(); // Fetch tags from the repository
      emit(state.copyWith(allTags: tags, filteredTags: tags));
    } catch (e) {
      log('Error loading tags: $e');
    }
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

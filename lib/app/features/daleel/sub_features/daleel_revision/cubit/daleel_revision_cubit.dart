// ignore_for_file: unused_field

import 'dart:developer';

import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:athar/app/features/daleel/presentation/models/daleel_filters.dart';
import 'package:athar/app/features/daleel/sub_features/daleel_revision/cubit/daleel_revision_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class DaleelRevisionCubit extends Cubit<DaleelRevisionState> {
  late CardSwiperController cardSwiperController;

  final DaleelRepository _repository;
  final DaleelFilters daleelFilters;
  DaleelRevisionCubit(this._repository, this.daleelFilters) : super(const DaleelRevisionState()) {
    initalizeDaleelRevision();
    cardSwiperController = CardSwiperController();
  }

  List<Daleel> getDaleels() => _repository.getSortedDaleels(daleelTypes: daleelFilters.daleelType);

  void initalizeDaleelRevision() {
    log('initialize daleels');
    final daleels = getDaleels();
    emit(state.copyWith(daleel: daleels));
  }

  void incrementRevisionCount(int id) {
    log('id of the daleel by incremented by 1 is $id');
    _repository.incrementRevisionCount(id);
  }

  @override
  Future<void> close() {
    cardSwiperController.dispose();
    return super.close();
  }
}

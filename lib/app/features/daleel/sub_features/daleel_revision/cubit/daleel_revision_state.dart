import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:equatable/equatable.dart';

enum DaleelRevisionStatus { initial, loading, success, failure }

class DaleelRevisionState extends Equatable {
  const DaleelRevisionState({
    this.daleels = const [],
    this.status = DaleelRevisionStatus.initial,
    this.currentIndex = 0,
    this.showReviewButton = false,
  });

  final List<Daleel> daleels;
  final DaleelRevisionStatus status;
  final int currentIndex;
  final bool showReviewButton;

  DaleelRevisionState copyWith({
    List<Daleel>? daleel,
    DaleelRevisionStatus? status,
    int? currentIndex,
    bool? showReviewButton,
  }) {
    return DaleelRevisionState(
      daleels: daleel ?? this.daleels,
      status: status ?? this.status,
      currentIndex: currentIndex ?? this.currentIndex,
      showReviewButton: showReviewButton ?? this.showReviewButton,
    );
  }

  @override
  List<Object> get props => [daleels, status, currentIndex, showReviewButton];
}

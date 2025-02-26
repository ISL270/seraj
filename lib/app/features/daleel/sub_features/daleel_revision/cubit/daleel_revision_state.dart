import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:equatable/equatable.dart';

final class DaleelRevisionState extends Equatable {
  final List<Daleel> daleels;

  const DaleelRevisionState({
    this.daleels = const [],
  });

  DaleelRevisionState copyWith({
    List<Daleel>? daleel,
  }) {
    return DaleelRevisionState(
      daleels: daleel ?? daleels,
    );
  }

  @override
  List<Object> get props => [daleels];
}

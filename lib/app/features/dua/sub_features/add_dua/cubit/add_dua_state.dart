part of 'add_dua_cubit.dart';

final class AddDuaState extends Equatable with FormzMixin {
  const AddDuaState({
    this.dua = const Name.pure(),
    this.reward = const Name.pure(),
    this.status = const Initial(),
    this.priority = Priority.normal,
    this.description = '',
    this.errorMessage,
    this.tags = const [],
  });

  final Name dua;
  final Name reward;
  final Priority priority;
  final VoidStatus status;
  final String description;
  final String? errorMessage;
  final List<Tag> tags;

  @override
  List<Object?> get props => [
        dua,
        reward,
        description,
        priority,
        status,
        errorMessage,
      ];

  AddDuaState copyWith({
    Name? dua,
    Name? reward,
    Priority? priority,
    String? description,
    double? sliderValue,
    VoidStatus? status,
    String? errorMessage,
  }) {
    return AddDuaState(
      priority: priority ?? this.priority,
      description: description ?? this.description,
      dua: dua ?? this.dua,
      reward: reward ?? this.reward,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // ignore: strict_raw_type
  List<FormzInput> get inputs => [dua];
}

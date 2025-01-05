part of 'add_dua_cubit.dart';

final class AddDuaState extends Equatable with FormzMixin {
  const AddDuaState({
    this.dua = const Name.pure(),
    this.reward = const Name.pure(),
    this.priority = Priority.normal,
    this.description = '',
    this.sliderValue = 0.0,
    this.status = const Initial(),
    this.errorMessage,
    this.tags = const [],
  });

  final double sliderValue;
  final Name dua;
  final Name reward;
  final Priority priority;
  final String? description;
  final String? errorMessage;
  final VoidStatus status;
  final List<String> tags;

  @override
  List<Object?> get props => [
        dua,
        reward,
        sliderValue,
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
      sliderValue: sliderValue ?? this.sliderValue,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // ignore: strict_raw_type
  List<FormzInput> get inputs => [dua];

  String get errorMsg {
    if (!status.isFailure) return '';
    return (status as Failure).exception.message ?? 'unkown error';
  }
}

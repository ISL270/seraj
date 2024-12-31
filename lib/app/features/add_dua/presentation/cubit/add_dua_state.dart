part of 'add_dua_cubit.dart';

final class AddDuaState extends Equatable with FormzMixin {
  const AddDuaState({
    this.textOfDua = const Name.pure(),
    this.reward = const Name.pure(),
    this.numOfRepeat = const Name.pure(),
    this.priority = '',
    this.explanation = '',
    this.status = const Initial(),
    this.errorMessage,
  });

  final Name textOfDua;
  final Name reward;
  final Name numOfRepeat;
  final String? priority;
  final String? explanation;
  final String? errorMessage;
  final VoidStatus status;

  @override
  List<Object?> get props => [
        textOfDua,
        reward,
        numOfRepeat,
        explanation,
        priority,
        status,
        errorMessage,
      ];

  AddDuaState copyWith({
    Name? textOfDua,
    Name? reward,
    Name? numOfRepeat,
    String? priority,
    String? explanation,
    VoidStatus? status,
    String? errorMessage,
  }) {
    return AddDuaState(
      priority: priority ?? this.priority,
      explanation: explanation ?? this.explanation,
      textOfDua: textOfDua ?? this.textOfDua,
      reward: reward ?? this.reward,
      numOfRepeat: numOfRepeat ?? this.numOfRepeat,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // ignore: strict_raw_type
  List<FormzInput> get inputs => [textOfDua];

  String get errorMsg {
    if (!status.isFailure) return '';
    return (status as Failure).exception.message ?? 'unkown error';
  }
}

part of 'add_dua_cubit.dart';

final class AddDuaState extends Equatable with FormzMixin {
  const AddDuaState({
    this.duaNotes,
    this.textOfDua = const Name.pure(),
    this.typeOfDua = const Name.pure(),
    this.numOfRepeat = const Name.pure(),
    this.duaTime = const Name.pure(),
    this.status = const Initial(),
    this.errorMessage,
  });

  final Name textOfDua;
  final Name typeOfDua;
  final Name numOfRepeat;
  final Name duaTime;
  final String? duaNotes;
  final VoidStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        textOfDua,
        typeOfDua,
        numOfRepeat,
        duaNotes,
        duaTime,
        status,
        errorMessage,
      ];

  AddDuaState copyWith({
    Name? textOfDua,
    Name? typeOfDua,
    Name? numOfRepeat,
    Name? duaTime,
    String? duaNotes,
    VoidStatus? status,
    String? errorMessage,
  }) {
    return AddDuaState(
      duaTime: duaTime ?? this.duaTime,
      duaNotes: duaNotes ?? this.duaNotes,
      textOfDua: textOfDua ?? this.textOfDua,
      typeOfDua: typeOfDua ?? this.typeOfDua,
      numOfRepeat: numOfRepeat ?? this.numOfRepeat,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // ignore: strict_raw_type
  List<FormzInput> get inputs => [textOfDua, typeOfDua, numOfRepeat];

  String get errorMsg {
    if (!status.isFailure) return '';
    return (status as Failure).exception.message ?? 'unkown error';
  }
}

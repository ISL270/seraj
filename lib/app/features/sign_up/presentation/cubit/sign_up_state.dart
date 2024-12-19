part of 'sign_up_cubit.dart';

final class SignUpState extends Equatable with FormzMixin {
  const SignUpState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.status = const Initial(),
  });

  final Name name;
  final Email email;
  final Password password;
  final ConfirmPassword confirmPassword;
  final VoidStatus status;

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        confirmPassword,
        status,
      ];

  SignUpState copyWith({
    Name? name,
    Email? email,
    Password? password,
    ConfirmPassword? confirmedPassword,
    VoidStatus? status,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmedPassword ?? confirmPassword,
      status: status ?? this.status,
    );
  }

  @override
  // ignore: strict_raw_type
  List<FormzInput> get inputs => [
        name,
        email,
        password,
        confirmPassword,
      ];

  String get errorMsg {
    if (!status.isFailure) return '';
    return (status as Failure).exception.message ?? 'unkown error';
  }
}

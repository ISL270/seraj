part of 'sign_up_cubit.dart';

final class SignUpState extends Equatable with FormzMixin {
  const SignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.status = const Initial(),
  });

  final Email email;
  final Password password;
  final ConfirmPassword confirmPassword;
  final VoidStatus status;

  @override
  List<Object?> get props => [
        email,
        password,
        confirmPassword,
        status,
      ];

  SignUpState copyWith({
    Email? email,
    Password? password,
    ConfirmPassword? confirmedPassword,
    VoidStatus? status,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmedPassword ?? confirmPassword,
      status: status ?? this.status,
    );
  }

  @override
  // ignore: strict_raw_type
  List<FormzInput> get inputs => [
        email,
        password,
        confirmPassword,
      ];

  String get errorMsg {
    if (!status.isFailure) return '';
    return (status as Failure).exception.message ?? 'unkown error';
  }
}

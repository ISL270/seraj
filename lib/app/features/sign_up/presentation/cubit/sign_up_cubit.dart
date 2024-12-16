import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/authentication/domain/models/user_type.dart';
import 'package:athar/app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository _authRepository;

  SignUpCubit(this._authRepository) : super(const SignUpState());

  void changeUserType(UserType userType) =>
      emit(state.copyWith(userType: userType));

  void emailChanged(String value) =>
      emit(state.copyWith(email: Email.dirty(value)));

  void nameChanged(String value) =>
      emit(state.copyWith(name: Name.dirty(value)));

  void phoneChanged(String value) {
    final pppp = PhoneNumber.dirty(value);
    emit(state.copyWith(phoneNumber: pppp));
  }

  void coachEmailChanged(String value) =>
      emit(state.copyWith(coachEmail: Email.dirty(value)));

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmPassword.dirty(
      password: password.value,
      value: state.confirmPassword.value,
    );
    emit(state.copyWith(
        password: password, confirmedPassword: confirmedPassword));
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(state.copyWith(confirmedPassword: confirmedPassword));
  }

  Future<void> signUpFormSubmitted() async {
    emit(state.copyWith(status: const Loading()));
    try {
      await _authRepository.signUp(
        state.userType,
        coachEmail: state.coachEmail.value,
        email: state.email.value,
        name: state.name.value,
        phoneNumber: state.phoneNumber.value,
        password: state.password.value,
      );
    } catch (e) {
      emit(state.copyWith(status: Failure(e as GenericException)));
    }
  }
}

import 'package:akukom/cores/utils/formz_validator/__forms.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupCubitState> {
  SignupCubit() : super(SignupCubitState.initial());

  void firstnameChanged(String value) {
    final firstname = Required.dirty(value);
    emit(state.copyWith(
      firstname: firstname,
    ));
  }

  void lastnameChanged(String value) {
    final lastname = Required.dirty(value);
    emit(state.copyWith(
      lastname: lastname,
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
    ));
  }

  void agreeChanged(bool value) {
    emit(state.copyWith(
      agree: value,
    ));
  }
}

import 'package:akukom/cores/utils/formz_validator/__forms.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_new_password_state.dart';

class CreateNewPasswordCubit extends Cubit<CreateNewPasswordState> {
  CreateNewPasswordCubit() : super(CreateNewPasswordState.initial());

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
    ));
  }

  void confirmPasswordChanged(String value) {
    final confirmPassword =
        CompareValue.dirty(value: value, compareTo: state.password.value);
    emit(state.copyWith(
      confirmPassword: confirmPassword,
    ));
  }

  void clear() {
    emit(CreateNewPasswordState.initial());
  }
}

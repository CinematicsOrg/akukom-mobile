import 'package:akukom/cores/utils/formz_validator/__forms.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PasswordCubitCubit extends Cubit<PasswordCubitState> {
  PasswordCubitCubit() : super(PasswordCubitState.initial());

  void currentPasswordChanged(String value) {
    final currentPassword = Password.dirty(value);
    emit(state.copyWith(
      currentPassword: currentPassword,
      isValid: _isFormValid(currentPassword, state.newPassword),
    ));
  }

  void newPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    emit(state.copyWith(
      newPassword: newPassword,
      isValid: _isFormValid(state.currentPassword, newPassword),
    ));
  }

  bool _isFormValid(Password? currentPassword, Password? newPassword) {
    return currentPassword?.isValid == true && newPassword?.isValid == true;
  }

  void reset() {
    emit(PasswordCubitState.initial());
  }
}

class PasswordCubitState extends Equatable {
  final Password? currentPassword;
  final Password? newPassword;
  final bool? isValid;

  const PasswordCubitState({
    this.currentPassword = const Password.pure(),
    this.newPassword = const Password.pure(),
    this.isValid = false,
  });

  factory PasswordCubitState.initial() {
    return const PasswordCubitState();
  }

  @override
  List<Object?> get props => [currentPassword, newPassword];

  PasswordCubitState copyWith({
    Password? currentPassword,
    Password? newPassword,
    bool? isValid,
  }) {
    return PasswordCubitState(
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  bool get stringify => true;
}

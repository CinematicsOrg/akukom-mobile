part of 'create_new_password_cubit.dart';

class CreateNewPasswordState extends Equatable {
  final Password password;
  final CompareValue confirmPassword;
  final bool isValid;

  const CreateNewPasswordState({
    this.password = const Password.pure(),
    this.confirmPassword = const CompareValue.pure(),
    this.isValid = false,
  });

  factory CreateNewPasswordState.initial() => const CreateNewPasswordState();

  CreateNewPasswordState copyWith({
    Password? password,
    CompareValue? confirmPassword,
  }) {
    bool updatedIsValid = (password ?? this.password).isValid &&
        (confirmPassword ?? this.confirmPassword).isValid;

    return CreateNewPasswordState(
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isValid: updatedIsValid,
    );
  }

  @override
  List<Object?> get props => [
        password,
        confirmPassword,
        isValid,
      ];

  @override
  String toString() {
    return '''CreateNewPasswordState {
      password: $password,
      confirmPassword: $confirmPassword,
      isValid: $isValid,
    }''';
  }
}

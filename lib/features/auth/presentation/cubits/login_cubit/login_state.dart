part of 'login_cubit.dart';

class LoginState extends Equatable {
  final Email email;
  final Password password;
  final bool isValid;

  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
  });

  factory LoginState.initial() => const LoginState();

  LoginState copyWith({
    Email? email,
    Password? password,
  }) {
    bool updatedIsValid =
        (email ?? this.email).isValid && (password ?? this.password).isValid;

    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: updatedIsValid,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        isValid,
      ];

  @override
  String toString() {
    return '''LoginState {
      email: $email,
      password: $password,
      isValid: $isValid,
    }''';
  }
}
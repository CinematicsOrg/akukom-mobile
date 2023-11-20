part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  final Email email;
  final bool isValid;

  const ForgotPasswordState({
    this.email = const Email.pure(),
    this.isValid = false,
  });

  factory ForgotPasswordState.initial() => const ForgotPasswordState();

  ForgotPasswordState copyWith({
    Email? email,
  }) {
    bool updatedIsValid = (email ?? this.email).isValid;

    return ForgotPasswordState(
      email: email ?? this.email,
      isValid: updatedIsValid,
    );
  }

  @override
  List<Object?> get props => [
        email,
        isValid,
      ];

  @override
  String toString() {
    return '''ForgotPasswordState {
      email: $email,
      isValid: $isValid,
    }''';
  }
}

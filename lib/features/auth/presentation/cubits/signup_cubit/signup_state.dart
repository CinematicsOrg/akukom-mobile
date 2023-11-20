part of 'signup_cubit.dart';

class SignupCubitState extends Equatable {
  final Required firstname;
  final Required lastname;
  final Email email;
  final Password password;
  final bool agree;
  final bool isValid;

  const SignupCubitState({
    this.firstname = const Required.pure(),
    this.lastname = const Required.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.agree = false,
    this.isValid = false,
  });

  factory SignupCubitState.initial() => const SignupCubitState();

  SignupCubitState copyWith({
    Required? firstname,
    Required? lastname,
    Email? email,
    Password? password,
    bool? agree,
  }) {
    bool updatedIsValid = (firstname ?? this.firstname).isValid &&
        (lastname ?? this.lastname).isValid &&
        (email ?? this.email).isValid &&
        (password ?? this.password).isValid && agree == true;
    return SignupCubitState(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      password: password ?? this.password,
      agree: agree ?? this.agree,
      isValid: updatedIsValid,
    );
  }

  @override
  List<Object?> get props => [
        firstname,
        lastname,
        email,
        agree,
        password,
        isValid,
      ];

  @override
  String toString() {
    return '''SignupState {
      firstname: $firstname,
      lastname: $lastname,
      email: $email,
      password: $password,
      agree: $agree,
      isValid: $isValid,
    }''';
  }
}

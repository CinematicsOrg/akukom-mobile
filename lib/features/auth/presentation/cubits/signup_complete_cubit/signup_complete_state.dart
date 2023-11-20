part of 'signup_complete_cubit.dart';

class SignupCompleteState extends Equatable {
  final Required phone;
  final Required countryOfResidence;
  final bool isValid;

  const SignupCompleteState({
    this.phone = const Required.pure(),
    this.countryOfResidence = const Required.pure(),
    this.isValid = false,
  });


  factory SignupCompleteState.initial() => const SignupCompleteState();

  SignupCompleteState copyWith({
    Required? phone,
    Required? countryOfResidence,
  }) {
    bool updatedIsValid =
        (countryOfResidence ?? this.countryOfResidence).isValid &&
            (phone ?? this.phone).isValid;

    return SignupCompleteState(
      phone: phone ?? this.phone,
      countryOfResidence: countryOfResidence ?? this.countryOfResidence,
      isValid: updatedIsValid,
    );
  }

  @override
  List<Object?> get props => [
        phone,
        countryOfResidence,
        isValid,
      ];

  @override
  String toString() {
    return '''SignupCompleteState {
      phone: $phone,
      countryOfResidence: $countryOfResidence,
      isValid: $isValid,
    }''';
  }
}

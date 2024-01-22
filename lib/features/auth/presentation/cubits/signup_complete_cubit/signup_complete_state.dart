part of 'signup_complete_cubit.dart';

class SignupCompleteState extends Equatable {
  final Required phone;
  final Required countryOfResidence;
  final Required countryPhoneCode;
  final Required tribe;
  final bool isValid;

  const SignupCompleteState({
    this.phone = const Required.pure(),
    this.countryOfResidence = const Required.pure(),
    this.countryPhoneCode = const Required.pure(),
    this.tribe = const Required.pure(),
    this.isValid = false,
  });

  factory SignupCompleteState.initial() => const SignupCompleteState();

  SignupCompleteState copyWith({
    Required? phone,
    Required? countryOfResidence,
    Required? countryPhoneCode,
    Required? tribe,
  }) {
    bool updatedIsValid =
        (countryOfResidence ?? this.countryOfResidence).isValid &&
            (phone ?? this.phone).isValid &&
            (countryPhoneCode ?? this.countryPhoneCode).isValid &&
            (tribe ?? this.tribe).isValid;

    return SignupCompleteState(
      phone: phone ?? this.phone,
      countryOfResidence: countryOfResidence ?? this.countryOfResidence,
      countryPhoneCode: countryPhoneCode ?? this.countryPhoneCode,
      tribe: tribe ?? this.tribe,
      isValid: updatedIsValid,
    );
  }

  @override
  List<Object?> get props => [
        phone,
        countryOfResidence,
        countryPhoneCode,
        tribe,
        isValid,
      ];

  @override
  String toString() {
    return '''SignupCompleteState {
      phone: $phone,
      countryOfResidence: $countryOfResidence,
      countryPhoneCode: $countryPhoneCode,
      tribe: $tribe,
      isValid: $isValid,
    }''';
  }
}

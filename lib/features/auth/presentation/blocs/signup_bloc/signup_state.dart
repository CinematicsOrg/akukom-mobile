part of 'signup_bloc.dart';

enum SignupStatus { initial, loading, success, failure }

extension SignupStatusX on SignupStatus {
  bool get isInitial => this == SignupStatus.initial;
  bool get isLoading => this == SignupStatus.loading;
  bool get isSuccess => this == SignupStatus.success;
  bool get isFailure => this == SignupStatus.failure;
}

class SignupState extends Equatable {
  final SignupStatus status;
  final SignupEntity? signupEntity;
  final Failures? failures;

  const SignupState({
    this.status = SignupStatus.initial,
    this.signupEntity,
    this.failures,
  });

  factory SignupState.initial() => const SignupState();

  SignupState copyWith({
    SignupStatus? status,
    SignupEntity? signupEntity,
    Failures? failures,
  }) {
    return SignupState(
      status: status ?? this.status,
      signupEntity: signupEntity ?? this.signupEntity,
      failures: failures ?? this.failures,
    );
  }

  @override
  List<Object?> get props => [
        status,
        signupEntity,
        failures,
      ];

  @override
  String toString() {
    return '''SignupState {
      status: $status,
      signupEntity: $signupEntity,
      failures: $failures,
    }''';
  }
}

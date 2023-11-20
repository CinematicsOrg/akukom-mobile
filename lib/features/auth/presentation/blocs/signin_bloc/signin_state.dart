part of 'signin_bloc.dart';

enum SigninStatus { initial, loading, success, failure }

extension SigninStatusX on SigninStatus {
  bool get isInitial => this == SigninStatus.initial;
  bool get isLoading => this == SigninStatus.loading;
  bool get isSuccess => this == SigninStatus.success;
  bool get isFailure => this == SigninStatus.failure;
}

class SigninState extends Equatable {
  final SigninStatus status;
  final SignupEntity? signupEntity;
  final Failures? failures;

  const SigninState({
    this.status = SigninStatus.initial,
    this.signupEntity,
    this.failures,
  });

  factory SigninState.initial() => const SigninState();

  SigninState copyWith({
    SigninStatus? status,
    SignupEntity? signupEntity,
    Failures? failures,
  }) {
    return SigninState(
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
    return '''SigninState {
      status: $status,
      signupEntity: $signupEntity,
      failures: $failures,
    }''';
  }
}

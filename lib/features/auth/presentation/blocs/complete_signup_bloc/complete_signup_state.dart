part of 'complete_signup_bloc.dart';

enum CompleteSignupStatus { initial, loading, success, failure }

extension CompleteSignupStatusX on CompleteSignupStatus {
  bool get isInitial => this == CompleteSignupStatus.initial;
  bool get isLoading => this == CompleteSignupStatus.loading;
  bool get isSuccess => this == CompleteSignupStatus.success;
  bool get isFailure => this == CompleteSignupStatus.failure;
}

class CompleteSignupState extends Equatable {
  final CompleteSignupStatus status;
  final BaseAuthEntity? baseAuthEntity;
  final Failures? failures;

  const CompleteSignupState({
    this.status = CompleteSignupStatus.initial,
    this.baseAuthEntity,
    this.failures,
  });

  factory CompleteSignupState.initial() => const CompleteSignupState();

  CompleteSignupState copyWith({
    CompleteSignupStatus? status,
    BaseAuthEntity? baseAuthEntity,
    Failures? failures,
  }) {
    return CompleteSignupState(
      status: status ?? this.status,
      baseAuthEntity: baseAuthEntity ?? this.baseAuthEntity,
      failures: failures ?? this.failures,
    );
  }

  @override
  List<Object?> get props => [
        status,
        baseAuthEntity,
        failures,
      ];

  @override
  String toString() {
    return '''CompleteSignupState {
      status: $status,
      baseAuthEntity: $baseAuthEntity,
      failures: $failures,
    }''';
  }
}

part of 'verify_phone_bloc.dart';

enum VerifyPhoneStatus { initial, loading, success, failure }

extension VerifyPhoneStatusX on VerifyPhoneStatus {
  bool get isInitial => this == VerifyPhoneStatus.initial;
  bool get isLoading => this == VerifyPhoneStatus.loading;
  bool get isSuccess => this == VerifyPhoneStatus.success;
  bool get isFailure => this == VerifyPhoneStatus.failure;
}

class VerifyPhoneState extends Equatable {
  final VerifyPhoneStatus status;
  final BaseAuthEntity? baseAuthEntity;
  final Failures? failures;

  const VerifyPhoneState({
    this.status = VerifyPhoneStatus.initial,
    this.baseAuthEntity,
    this.failures,
  });

  factory VerifyPhoneState.initial() => const VerifyPhoneState();

  VerifyPhoneState copyWith({
    VerifyPhoneStatus? status,
    BaseAuthEntity? baseAuthEntity,
    Failures? failures,
  }) {
    return VerifyPhoneState(
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
    return '''VerifyPhoneState {
      status: $status,
      baseAuthEntity: $baseAuthEntity,
      failures: $failures,
    }''';
  }
}

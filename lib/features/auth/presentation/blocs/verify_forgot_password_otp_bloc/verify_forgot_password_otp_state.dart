part of 'verify_forgot_password_otp_bloc.dart';

enum VerifyForgotPasswordOtpStatus { initial, loading, success, failure }

extension VerifyForgotPasswordOtpStatusX on VerifyForgotPasswordOtpStatus {
  bool get isInitial => this == VerifyForgotPasswordOtpStatus.initial;
  bool get isLoading => this == VerifyForgotPasswordOtpStatus.loading;
  bool get isSuccess => this == VerifyForgotPasswordOtpStatus.success;
  bool get isFailure => this == VerifyForgotPasswordOtpStatus.failure;
}

class VerifyForgotPasswordOtpState extends Equatable {
  final VerifyForgotPasswordOtpStatus status;
  final BaseEntity? baseEntity;
  final Failures? failures;

  const VerifyForgotPasswordOtpState({
    this.status = VerifyForgotPasswordOtpStatus.initial,
    this.baseEntity,
    this.failures,
  });

  factory VerifyForgotPasswordOtpState.initial() =>
      const VerifyForgotPasswordOtpState();

  VerifyForgotPasswordOtpState copyWith({
    VerifyForgotPasswordOtpStatus? status,
    BaseEntity? baseEntity,
    Failures? failures,
  }) {
    return VerifyForgotPasswordOtpState(
      status: status ?? this.status,
      baseEntity: baseEntity ?? this.baseEntity,
      failures: failures ?? this.failures,
    );
  }

  @override
  List<Object?> get props => [
        status,
        baseEntity,
        failures,
      ];

  @override
  String toString() {
    return '''VerifyForgotPasswordOtpState {
      status: $status,
      baseEntity: $baseEntity,
      failures: $failures,
    }''';
  }
}

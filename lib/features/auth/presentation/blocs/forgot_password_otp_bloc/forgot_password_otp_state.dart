part of 'forgot_password_otp_bloc.dart';

enum ForgotPasswordOtpStatusUI { init, loading, error, done }

extension ForgotPasswordOtpStatusUIExtension on ForgotPasswordOtpStatusUI {
  bool get isInit => this == ForgotPasswordOtpStatusUI.init;
  bool get isLoading => this == ForgotPasswordOtpStatusUI.loading;
  bool get isError => this == ForgotPasswordOtpStatusUI.error;
  bool get isDone => this == ForgotPasswordOtpStatusUI.done;
}

class ForgotPasswordOtpState extends Equatable {
  final ForgotPasswordOtpStatusUI statusUI;
  final Failures? failure;
  final BaseEntity? data;

  const ForgotPasswordOtpState({
    this.statusUI = ForgotPasswordOtpStatusUI.init,
    this.failure,
    this.data,
  });

  factory ForgotPasswordOtpState.initial() => const ForgotPasswordOtpState();

  ForgotPasswordOtpState copyWith({
    ForgotPasswordOtpStatusUI? statusUI,
    Failures? failure,
    BaseEntity? data,
  }) {
    return ForgotPasswordOtpState(
      statusUI: statusUI ?? this.statusUI,
      failure: failure ?? this.failure,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [
        statusUI,
        failure,
        data,
      ];

  @override
  String toString() {
    return '''ForgotPasswordOtpState {
      statusUI: $statusUI,
      failure: $failure,
      data: $data,
    }''';
  }
}

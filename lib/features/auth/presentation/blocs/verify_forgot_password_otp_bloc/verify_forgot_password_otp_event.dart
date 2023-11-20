part of 'verify_forgot_password_otp_bloc.dart';

class VerifyForgotPasswordOtpEvent extends Equatable {
  const VerifyForgotPasswordOtpEvent();

  @override
  List<Object> get props => [];
}

class VerifyForgotPasswordOtpButtonPressed
    extends VerifyForgotPasswordOtpEvent {
  final RequestParam param;

  const VerifyForgotPasswordOtpButtonPressed({
    required this.param,
  });

  @override
  List<Object> get props => [param];
}

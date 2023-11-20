part of 'forgot_password_otp_bloc.dart';

class ForgotPasswordOtpEvent extends Equatable {
  const ForgotPasswordOtpEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordOtpButtonPressed extends ForgotPasswordOtpEvent {
  final RequestParam param;

  const ForgotPasswordOtpButtonPressed({
    required this.param,
  });

  @override
  List<Object> get props => [param];
}

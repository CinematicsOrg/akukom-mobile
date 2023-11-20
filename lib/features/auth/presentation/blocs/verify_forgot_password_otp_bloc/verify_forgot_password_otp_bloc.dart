import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/auth/domain/usecases/forgot_password_verification_otp_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_forgot_password_otp_event.dart';
part 'verify_forgot_password_otp_state.dart';

class VerifyForgotPasswordOtpBloc
    extends Bloc<VerifyForgotPasswordOtpEvent, VerifyForgotPasswordOtpState> {
  final ForgotPasswordVerificationUseCase forgotPasswordVerificationUseCase;
  VerifyForgotPasswordOtpBloc({
    required this.forgotPasswordVerificationUseCase,
  }) : super(VerifyForgotPasswordOtpState.initial()) {
    on<VerifyForgotPasswordOtpButtonPressed>(
        _onVerifyForgotPasswordOtpButtonPressed);
  }

  void _onVerifyForgotPasswordOtpButtonPressed(
    VerifyForgotPasswordOtpButtonPressed event,
    Emitter<VerifyForgotPasswordOtpState> emit,
  ) async {
    emit(state.copyWith(status: VerifyForgotPasswordOtpStatus.loading));
    final result = await forgotPasswordVerificationUseCase(event.param);
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: VerifyForgotPasswordOtpStatus.failure,
          failures: failure,
        ));
      },
      (data) {
        emit(state.copyWith(
          status: VerifyForgotPasswordOtpStatus.success,
          baseEntity: data,
        ));
      },
    );
  }
}

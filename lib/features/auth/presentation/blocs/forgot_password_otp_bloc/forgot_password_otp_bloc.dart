import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgot_password_otp_event.dart';
part 'forgot_password_otp_state.dart';

class ForgotPasswordOtpBloc
    extends Bloc<ForgotPasswordOtpEvent, ForgotPasswordOtpState> {
  final ForgotPasswordUseCase forgotPasswordUseCase;
  ForgotPasswordOtpBloc({
    required this.forgotPasswordUseCase,
  }) : super(ForgotPasswordOtpState.initial()) {
    on<ForgotPasswordOtpButtonPressed>(_onForgotPasswordOtpButtonPressed);
  }

  void _onForgotPasswordOtpButtonPressed(
    ForgotPasswordOtpButtonPressed event,
    Emitter<ForgotPasswordOtpState> emit,
  ) async {
    emit(state.copyWith(statusUI: ForgotPasswordOtpStatusUI.loading));
    final result = await forgotPasswordUseCase(event.param);
    result.fold(
      (failure) {
        emit(state.copyWith(
          statusUI: ForgotPasswordOtpStatusUI.error,
          failure: failure,
        ));
      },
      (data) {
        emit(state.copyWith(
          statusUI: ForgotPasswordOtpStatusUI.done,
          data: data,
        ));
      },
    );
  }
}

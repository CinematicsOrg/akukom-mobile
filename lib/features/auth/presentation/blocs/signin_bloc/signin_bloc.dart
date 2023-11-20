import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final LoginUseCase loginUseCase;
  SigninBloc({
    required this.loginUseCase,
  }) : super(SigninState.initial()) {
    on<SigninButtonPressed>(_onSigninButtonPressed);
  }

  void _onSigninButtonPressed(
    SigninButtonPressed event,
    Emitter<SigninState> emit,
  ) async {
    emit(state.copyWith(status: SigninStatus.loading));
    final result = await loginUseCase(event.param);
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: SigninStatus.failure,
          failures: failure,
        ));
      },
      (data) {
        emit(state.copyWith(
          status: SigninStatus.success,
          signupEntity: data,
        ));
      },
    );
  }
}

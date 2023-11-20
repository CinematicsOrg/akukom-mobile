import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUseCase signupUseCase;
  SignupBloc({
    required this.signupUseCase,
  }) : super(SignupState.initial()) {
    on<SignupButtonPressed>(_onSignupButtonPressed);
  }

  void _onSignupButtonPressed(
    SignupButtonPressed event,
    Emitter<SignupState> emit,
  ) async {
    emit(state.copyWith(status: SignupStatus.loading));
    final result = await signupUseCase(event.param);
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: SignupStatus.failure,
          failures: failure,
        ));
      },
      (data) {
        emit(state.copyWith(
          status: SignupStatus.success,
          signupEntity: data,
        ));
      },
    );
  }
}

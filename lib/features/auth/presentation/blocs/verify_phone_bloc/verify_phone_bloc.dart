import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_phone_event.dart';
part 'verify_phone_state.dart';

class VerifyPhoneBloc extends Bloc<VerifyPhoneEvent, VerifyPhoneState> {
  final VerifyPhoneNumberUseCase verifyPhoneNumberUseCase;
  VerifyPhoneBloc({
    required this.verifyPhoneNumberUseCase,
  }) : super(VerifyPhoneState.initial()) {
    on<VerifyPhoneButtonEvent>(_onVerifyPhoneButtonEvent);
  }

  void _onVerifyPhoneButtonEvent(
    VerifyPhoneButtonEvent event,
    Emitter<VerifyPhoneState> emit,
  ) async {
    emit(state.copyWith(status: VerifyPhoneStatus.loading));
    final result = await verifyPhoneNumberUseCase(event.param);
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: VerifyPhoneStatus.failure,
          failures: failure,
        ));
      },
      (data) {
        emit(state.copyWith(
          status: VerifyPhoneStatus.success,
          baseAuthEntity: data,
        ));
      },
    );
  }
}

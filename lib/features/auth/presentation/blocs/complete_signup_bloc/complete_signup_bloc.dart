import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'complete_signup_event.dart';
part 'complete_signup_state.dart';

class CompleteSignupBloc
    extends Bloc<CompleteSignupEvent, CompleteSignupState> {
  final CompleteSignupUseCase completeSignupUseCase;
  CompleteSignupBloc({
    required this.completeSignupUseCase,
  }) : super(CompleteSignupState.initial()) {
    on<CompleteSignupButtonPressed>(_onCompleteSignupButtonPressed);
  }

  void _onCompleteSignupButtonPressed(
    CompleteSignupButtonPressed event,
    Emitter<CompleteSignupState> emit,
  ) async {
    emit(state.copyWith(status: CompleteSignupStatus.loading));
    final result = await completeSignupUseCase(event.param);
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: CompleteSignupStatus.failure,
          failures: failure,
        ));
      },
      (data) {
        emit(state.copyWith(
          status: CompleteSignupStatus.success,
          baseAuthEntity: data,
        ));
      },
    );
  }
}

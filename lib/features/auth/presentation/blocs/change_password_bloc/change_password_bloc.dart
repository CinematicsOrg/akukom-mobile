import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePasswordUseCase changePasswordUseCase;
  ChangePasswordBloc({
    required this.changePasswordUseCase,
  }) : super(ChangePasswordState.initial()) {
    on<ChangePasswordButtonPressed>(_onChangePasswordButtonPressed);
  }

  void _onChangePasswordButtonPressed(
    ChangePasswordButtonPressed event,
    Emitter<ChangePasswordState> emit,
  ) async {
    emit(state.copyWith(status: ChangePasswordStatus.loading));
    final result = await changePasswordUseCase(event.param);
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: ChangePasswordStatus.failure,
          failures: failure,
        ));
      },
      (data) {
        emit(state.copyWith(
          status: ChangePasswordStatus.success,
          data: data,
        ));
      },
    );
  }
}

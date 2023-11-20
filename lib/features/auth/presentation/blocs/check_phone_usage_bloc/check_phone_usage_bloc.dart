import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_phone_usage_event.dart';
part 'check_phone_usage_state.dart';

class CheckPhoneUsageBloc
    extends Bloc<CheckPhoneUsageEvent, CheckPhoneUsageState> {
  final CheckPhoneUsageUseCase checkPhoneUsageUseCase;
  CheckPhoneUsageBloc({
    required this.checkPhoneUsageUseCase,
  }) : super(CheckPhoneUsageState.initial()) {
    on<CheckPhoneUsageEventStarted>(_onCheckPhoneUsageEventStarted);
  }

  void _onCheckPhoneUsageEventStarted(
    CheckPhoneUsageEventStarted event,
    Emitter<CheckPhoneUsageState> emit,
  ) async {
    emit(state.copyWith(status: CheckPhoneUsageStatus.loading));
    final result = await checkPhoneUsageUseCase(event.param);
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: CheckPhoneUsageStatus.failure,
          failures: failure,
        ));
      },
      (data) {
        emit(state.copyWith(
          status: CheckPhoneUsageStatus.success,
          baseEntity: data,
        ));
      },
    );
  }
}

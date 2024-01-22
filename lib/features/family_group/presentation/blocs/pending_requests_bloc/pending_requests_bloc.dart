import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pending_requests_event.dart';
part 'pending_requests_state.dart';

class PendingRequestsBloc
    extends Bloc<PendingRequestsEvent, PendingRequestsState> {
  final ListPendingFamilyUseCase listPendingFamilyUseCase;
  PendingRequestsBloc({
    required this.listPendingFamilyUseCase,
  }) : super(PendingRequestsState.initial()) {
    on<PendingRequestsUserEvent>(_onPendingRequestsUserEvent);
  }

  void _onPendingRequestsUserEvent(
    PendingRequestsUserEvent event,
    Emitter<PendingRequestsState> emit,
  ) async {
    emit(state.copyWith(status: PendingRequestsStatus.loading));
    final result = await listPendingFamilyUseCase(event.param);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: PendingRequestsStatus.failure,
          failure: failure,
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: PendingRequestsStatus.success,
          data: data,
        ),
      ),
    );
  }
}

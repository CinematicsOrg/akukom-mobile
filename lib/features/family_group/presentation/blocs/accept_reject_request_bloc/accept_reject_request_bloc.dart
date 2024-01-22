import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'accept_reject_request_event.dart';
part 'accept_reject_request_state.dart';

class AcceptRejectRequestBloc
    extends Bloc<AcceptRejectRequestEvent, AcceptRejectRequestState> {
  final AcceptOrRejectRequestUseCase acceptOrRejectRequestUseCase;
  AcceptRejectRequestBloc({
    required this.acceptOrRejectRequestUseCase,
  }) : super(AcceptRejectRequestState.initial()) {
    on<AcceptRejectRequestUserEvent>(_onAcceptRejectRequestUserEvent);
  }

  void _onAcceptRejectRequestUserEvent(
    AcceptRejectRequestUserEvent event,
    Emitter<AcceptRejectRequestState> emit,
  ) async {
    emit(state.copyWith(status: AcceptRejectRequestStatus.loading));
    final result = await acceptOrRejectRequestUseCase(event.param);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AcceptRejectRequestStatus.failure,
          failure: failure,
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: AcceptRejectRequestStatus.success,
          data: data,
        ),
      ),
    );
  }
}

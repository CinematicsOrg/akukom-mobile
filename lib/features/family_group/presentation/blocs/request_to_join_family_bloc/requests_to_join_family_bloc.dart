import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'requests_to_join_family_event.dart';
part 'requests_to_join_family_state.dart';

class RequestsToJoinFamilyBloc
    extends Bloc<RequestsToJoinFamilyEvent, RequestsToJoinFamilyState> {
  final RequestToJoinFamilyUseCase requestToJoinFamilyUseCase;
  RequestsToJoinFamilyBloc({
    required this.requestToJoinFamilyUseCase,
  }) : super(RequestsToJoinFamilyState.initial()) {
    on<RequestsToJoinFamilyUserEvent>(_onRequestsToJoinFamilyUserEvent);
  }

  void _onRequestsToJoinFamilyUserEvent(
    RequestsToJoinFamilyUserEvent event,
    Emitter<RequestsToJoinFamilyState> emit,
  ) async {
    emit(state.copyWith(status: RequestsToJoinFamilyStatus.loading));
    final result = await requestToJoinFamilyUseCase(event.param);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: RequestsToJoinFamilyStatus.failure,
          failure: failure,
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: RequestsToJoinFamilyStatus.success,
          data: data,
        ),
      ),
    );
  }
}

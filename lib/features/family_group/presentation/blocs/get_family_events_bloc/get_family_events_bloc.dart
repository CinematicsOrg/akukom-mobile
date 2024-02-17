import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_family_events_event.dart';
part 'get_family_events_state.dart';

class GetFamilyEventsBloc
    extends Bloc<GetFamilyEventsEvent, GetFamilyEventsState> {
  final GetFamilyEventsUseCase getFamilyEventsUseCase;
  GetFamilyEventsBloc({
    required this.getFamilyEventsUseCase,
  }) : super(GetFamilyEventsState.initial()) {
    on<GetFamilyEventsList>(_onGetFamilyEventsListHandler);
  }

  void _onGetFamilyEventsListHandler(
    GetFamilyEventsList event,
    Emitter<GetFamilyEventsState> emit,
  ) async {
    emit(state.copyWith(status: GetFamilyEventsStateStatus.loading));
    final result = await getFamilyEventsUseCase(const NoParams());
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: GetFamilyEventsStateStatus.error,
          failure: failure,
        ));
      },
      (familyEvents) {
        emit(
          state.copyWith(
            status: GetFamilyEventsStateStatus.loaded,
            familyEvents: familyEvents.data?.docs,
            familyEventData: familyEvents,
          ),
        );
      },
    );
  }
}

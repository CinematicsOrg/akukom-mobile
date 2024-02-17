import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_family_event_event.dart';
part 'create_family_event_state.dart';

class CreateFamilyEventBloc
    extends Bloc<CreateFamilyEventEvent, CreateFamilyEventState> {
  final CreateFamilyEventUseCase createFamilyEventUseCase;
  CreateFamilyEventBloc({
    required this.createFamilyEventUseCase,
  }) : super(CreateFamilyEventState.initial()) {
    on<CreateFamilysEvent>(_onCreateFamilyEventHandler);
  }

  void _onCreateFamilyEventHandler(
    CreateFamilysEvent event,
    Emitter<CreateFamilyEventState> emit,
  ) async {
    emit(state.copyWith(status: CreateFamilyEventStateStatus.loading));
    final result = await createFamilyEventUseCase(event.params);
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: CreateFamilyEventStateStatus.error,
          failure: failure,
        ));
      },
      (familyEvent) {
        emit(
          state.copyWith(
            status: CreateFamilyEventStateStatus.loaded,
          ),
        );
      },
    );
  }
}

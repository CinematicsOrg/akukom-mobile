import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_family_event.dart';
part 'update_family_state.dart';

class UpdateFamilyBloc extends Bloc<UpdateFamilyEvent, UpdateFamilyState> {
  final UpdateFamilyUseCase updateFamilyUseCase;
  UpdateFamilyBloc({
    required this.updateFamilyUseCase,
  }) : super(UpdateFamilyState.initial()) {
    on<UpdateFamilyUserEvent>(_onUpdateFamilyUserEvent);
  }

  void _onUpdateFamilyUserEvent(
    UpdateFamilyUserEvent event,
    Emitter<UpdateFamilyState> emit,
  ) async {
    emit(state.copyWith(status: UpdateFamilyStatus.loading));
    final result = await updateFamilyUseCase(event.param);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: UpdateFamilyStatus.failure,
          failure: failure,
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: UpdateFamilyStatus.success,
          data: data,
        ),
      ),
    );
  }
}

import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_family_event.dart';
part 'create_family_state.dart';

class CreateFamilyBloc extends Bloc<CreateFamilyEvent, CreateFamilyState> {
  final CreateFamilyUseCase createFamilyUseCase;
  CreateFamilyBloc({
    required this.createFamilyUseCase,
  }) : super(CreateFamilyState.initial()) {
    on<CreateFamilyUserEvent>(_onCreateFamilyUserEvent);
  }

  Future<void> _onCreateFamilyUserEvent(
    CreateFamilyUserEvent event,
    Emitter<CreateFamilyState> emit,
  ) async {
    emit(state.copyWith(status: CreateFamilyStatus.loading));
    final result = await createFamilyUseCase(event.param);
    result.fold(
      (failures) {
        emit(state.copyWith(
          status: CreateFamilyStatus.failure,
          message: failures.message,
        ));
      },
      (data) {
        emit(state.copyWith(
          status: CreateFamilyStatus.success,
          data: data,
        ));
      },
    );
  }
}

import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_family_members_event.dart';
part 'add_family_members_state.dart';

class AddFamilyMembersBloc
    extends Bloc<AddFamilyMembersEvent, AddFamilyMembersState> {
  final AddFamilyMembersUseCase addFamilyMembersUseCase;
  AddFamilyMembersBloc({
    required this.addFamilyMembersUseCase,
  }) : super(AddFamilyMembersState.initial()) {
    on<AddFamilyMembersUserEvent>(_onAddFamilyMembersUserEvent);
  }

  void _onAddFamilyMembersUserEvent(
    AddFamilyMembersUserEvent event,
    Emitter<AddFamilyMembersState> emit,
  ) async {
    emit(state.copyWith(status: AddFamilyMembersStatus.loading));
    final result = await addFamilyMembersUseCase(event.param);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AddFamilyMembersStatus.failure,
          failure: failure,
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: AddFamilyMembersStatus.success,
          data: data.data,
        ),
      ),
    );
  }
}

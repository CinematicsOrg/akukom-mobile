import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_family_members_event.dart';
part 'get_family_members_state.dart';

class GetFamilyMembersBloc
    extends Bloc<GetFamilyMembersEvent, GetFamilyMembersState> {
  final GetFamilyMembersUseCase getFamilyMembersUseCase;
  GetFamilyMembersBloc({
    required this.getFamilyMembersUseCase,
  }) : super(GetFamilyMembersState.initial()) {
    on<GetFamilyMembersUserEvent>(_onGetFamilyMembersUserEvent);
  }

  void _onGetFamilyMembersUserEvent(
    GetFamilyMembersUserEvent event,
    Emitter<GetFamilyMembersState> emit,
  ) async {
    emit(state.copyWith(status: GetFamilyMembersStatus.loading));
    final result = await getFamilyMembersUseCase(event.param);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: GetFamilyMembersStatus.failure,
          failure: failure,
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: GetFamilyMembersStatus.success,
          data: data,
        ),
      ),
    );
  }
}

import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_family_family_user_can_join_event.dart';
part 'get_family_family_user_can_join_state.dart';

class GetFamilyFamilyUserCanJoinBloc extends Bloc<
    GetFamilyFamilyUserCanJoinEvent, GetFamilyFamilyUserCanJoinState> {
  final ListFamilyUserCanJoinUseCase listFamilyUserCanJoinUseCase;
  GetFamilyFamilyUserCanJoinBloc({
    required this.listFamilyUserCanJoinUseCase,
  }) : super(GetFamilyFamilyUserCanJoinState.initial()) {
    on<GetFamilyFamilyUserCanJoinUserEvent>(
        _onGetFamilyFamilyUserCanJoinUserEvent);
  }

  void _onGetFamilyFamilyUserCanJoinUserEvent(
    GetFamilyFamilyUserCanJoinUserEvent event,
    Emitter<GetFamilyFamilyUserCanJoinState> emit,
  ) async {
    emit(state.copyWith(status: GetFamilyFamilyUserCanJoinStatus.loading));
    final result = await listFamilyUserCanJoinUseCase(event.param);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: GetFamilyFamilyUserCanJoinStatus.failure,
          failure: failure,
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: GetFamilyFamilyUserCanJoinStatus.success,
          data: data,
          familyList: data.data?.docs,
        ),
      ),
    );
  }
}

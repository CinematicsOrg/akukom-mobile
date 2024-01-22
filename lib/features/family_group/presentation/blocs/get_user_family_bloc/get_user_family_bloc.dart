import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_user_family_event.dart';
part 'get_user_family_state.dart';

class GetUserFamilyBloc extends Bloc<GetUserFamilyEvent, GetUserFamilyState> {
  final GetUserFamilyUseCase getUserFamilyUseCase;
  GetUserFamilyBloc({
    required this.getUserFamilyUseCase,
  }) : super(GetUserFamilyState.initial()) {
    on<GetUserFamilyUserEvent>(_onGetUserFamilyUserEvent);
  }

  void _onGetUserFamilyUserEvent(
    GetUserFamilyUserEvent event,
    Emitter<GetUserFamilyState> emit,
  ) async {
    emit(state.copyWith(status: GetUserFamilyStatus.loading));
    final result = await getUserFamilyUseCase(event.param);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: GetUserFamilyStatus.failure,
          failure: failure,
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: GetUserFamilyStatus.success,
          data: data,
          familyData: data?.data?.docs,
        ),
      ),
    );
  }
}

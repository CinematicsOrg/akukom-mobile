

import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_in_family_event.dart';
part 'user_in_family_state.dart';

class UserInFamilyBloc extends Bloc<UserInFamilyEvent, UserInFamilyState> {
  final UserInFamilyUseCase userInFamilyUseCase;
  UserInFamilyBloc({
    required this.userInFamilyUseCase,
  }) : super(UserInFamilyState.initial()) {
    on<UserInFamilyUserEvent>(_onUserInFamilyUserEvent);
  }

  void _onUserInFamilyUserEvent(
    UserInFamilyUserEvent event,
    Emitter<UserInFamilyState> emit,
  ) async {
    emit(state.copyWith(status: UserInFamilyStatus.loading));
    final result = await userInFamilyUseCase(event.param);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: UserInFamilyStatus.failure,
          failure: failure,
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: UserInFamilyStatus.success,
          data: data,
        ),
      ),
    );
  }
}

import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_user_list_event.dart';
part 'get_user_list_state.dart';

class GetUserListBloc extends Bloc<GetUserListEvent, GetUserListState> {
  final GetUsersUseCase getUsersUseCase;
  GetUserListBloc({
    required this.getUsersUseCase,
  }) : super(GetUserListState.initial()) {
    on<GetUserListUserEvent>(_onGetUserListUserEvent);
  }

  void _onGetUserListUserEvent(
    GetUserListUserEvent event,
    Emitter<GetUserListState> emit,
  ) async {
    emit(state.copyWith(status: GetUserListStatus.loading));
    final result = await getUsersUseCase(event.param);
    result.fold(
        (failure) => emit(
              state.copyWith(
                status: GetUserListStatus.failure,
                failure: failure,
              ),
            ), (data) {
              print(data.data);
      final refresh = event.param.refresh;
      if (refresh) {
        emit(state.copyWith(
          status: GetUserListStatus.success,
          data: data,
          usersList: data.data?.docs ?? [],
        ));
        return;
      } else {
        final oldData = state.usersList;
        if (oldData != null) {
          final oldUsersList = state.usersList;
          final newUsersList = data.data?.docs;
          final usersList = [...oldUsersList!, ...newUsersList!];
          emit(
            state.copyWith(
              status: GetUserListStatus.success,
              data: data,
              usersList: usersList,
            ),
          );
          return;
        } else {
          emit(
            state.copyWith(
              status: GetUserListStatus.success,
              data: data,
              usersList: data.data?.docs,
            ),
          );
          return;
        }
      }
    });
  }
}

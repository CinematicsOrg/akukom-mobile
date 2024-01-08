import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initial()) {
    on<GetUserEvent>(_getUserHandler);
    on<UpdateUser>(_updateUserHandler);
  }

  Future<void> _getUserHandler(
      GetUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      final User? user = await SessionManager.instance.getUser;
      emit(state.copyWith(status: UserStatus.loaded, user: user));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error, message: e.toString()));
    }
  }

  Future<void> _updateUserHandler(
      UpdateUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      final user = await SessionManager.instance.saveUserData(event.user);
      emit(state.copyWith(status: UserStatus.loaded, user: user));
      // update user in bloc
      add(GetUserEvent());
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error, message: e.toString()));
    }
  }
}

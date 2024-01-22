import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_change_password_event.dart';
part 'profile_change_password_state.dart';

class ProfileChangePasswordBloc
    extends Bloc<ProfileChangePasswordEvent, ProfileChangePasswordState> {
  final ProfileChangePasswordUseCase profileChangePasswordUseCase;
  ProfileChangePasswordBloc({
    required this.profileChangePasswordUseCase,
  }) : super(ProfileChangePasswordState.initial()) {
    on<ProfileUserChangePasswordEvent>(
        _onProfileUserChangePasswordEventHandler);
  }

  void _onProfileUserChangePasswordEventHandler(
    ProfileUserChangePasswordEvent event,
    Emitter<ProfileChangePasswordState> emit,
  ) async {
    emit(state.copyWith(status: ProfileChangePasswordStatus.loading));
    final result = await profileChangePasswordUseCase(event.params);
    result.fold(
      (failures) {
        emit(state.copyWith(
          status: ProfileChangePasswordStatus.failure,
          failures: failures,
        ));
      },
      (data) {
        emit(state.copyWith(
          status: ProfileChangePasswordStatus.success,
          message: data.message,
          profileChangePasswordEntity: data,
        ));
      },
    );
  }
}

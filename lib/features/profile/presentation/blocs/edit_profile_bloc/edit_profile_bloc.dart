import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final EditProfileUseCase editProfileUseCase;
  EditProfileBloc({
    required this.editProfileUseCase,
  }) : super(EditProfileState.initial()) {
    on<UpdateProfileEvent>(_onUpdateProfileEventHandler);
  }

  void _onUpdateProfileEventHandler(
    UpdateProfileEvent event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(state.copyWith(status: EditProfileStatus.loading));
    final result = await editProfileUseCase(event.params);
    result.fold(
      (failures) {
        emit(state.copyWith(
          status: EditProfileStatus.failure,
          failures: failures,
        ));
      },
      (data) {
        emit(state.copyWith(
          status: EditProfileStatus.success,
          editProfileEntity: data
        ));
      },
    );
  }
}

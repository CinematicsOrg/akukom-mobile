import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_upload_image_event.dart';
part 'profile_upload_image_state.dart';

class ProfileUploadImageBloc
    extends Bloc<ProfileUploadImageEvent, ProfileUploadImageState> {
  final UploadProfileImageUseCase uploadProfileImageUseCase;

  ProfileUploadImageBloc({
    required this.uploadProfileImageUseCase,
  }) : super(ProfileUploadImageState.initial()) {
    on<ProfileUploadImageEventStarted>(
        _onProfileUploadImageEventStartedHandler);
  }

  void _onProfileUploadImageEventStartedHandler(
    ProfileUploadImageEventStarted event,
    Emitter<ProfileUploadImageState> emit,
  ) async {
    emit(state.copyWith(status: ProfileUploadImageStatus.loading));
    final result = await uploadProfileImageUseCase(event.params);
    result.fold(
      (failures) {
        emit(
          state.copyWith(
            status: ProfileUploadImageStatus.failure,
            failures: failures,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            status: ProfileUploadImageStatus.success,
            data: data,
            message: 'Success upload profile image',
          ),
        );
      },
    );
  }
}

part of 'profile_upload_image_bloc.dart';

abstract class ProfileUploadImageEvent extends Equatable {
  const ProfileUploadImageEvent();

  @override
  List<Object?> get props => [];
}

class ProfileUploadImageEventStarted extends ProfileUploadImageEvent {
  final UploadProfileImageParams params;

  const ProfileUploadImageEventStarted({required this.params});

  @override
  List<Object?> get props => [params];
}

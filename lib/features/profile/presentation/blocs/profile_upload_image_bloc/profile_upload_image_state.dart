part of 'profile_upload_image_bloc.dart';

enum ProfileUploadImageStatus {
  initial,
  loading,
  success,
  failure,
}

extension ProfileUploadImageStatusX on ProfileUploadImageStatus {
  bool get isInitial => this == ProfileUploadImageStatus.initial;
  bool get isLoading => this == ProfileUploadImageStatus.loading;
  bool get isSuccess => this == ProfileUploadImageStatus.success;
  bool get isFailure => this == ProfileUploadImageStatus.failure;
}

class ProfileUploadImageState extends Equatable {
  final ProfileUploadImageStatus status;
  final String? message;
  final EditProfileEntity? data;
  final Failures? failures;

  const ProfileUploadImageState({
    required this.status,
    this.message,
    this.failures,
    this.data,
  });

  factory ProfileUploadImageState.initial() {
    return const ProfileUploadImageState(
      status: ProfileUploadImageStatus.initial,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        failures,
        data,
      ];

  ProfileUploadImageState copyWith({
    ProfileUploadImageStatus? status,
    String? message,
    Failures? failures,
    EditProfileEntity? data,
  }) {
    return ProfileUploadImageState(
      status: status ?? this.status,
      message: message ?? this.message,
      failures: failures ?? this.failures,
      data: data ?? this.data,
    );
  }

  @override
  bool? get stringify => true;
}

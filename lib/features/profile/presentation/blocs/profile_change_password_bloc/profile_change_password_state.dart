part of 'profile_change_password_bloc.dart';

enum ProfileChangePasswordStatus { initial, loading, success, failure }

extension ProfileChangePasswordStatusX on ProfileChangePasswordStatus {
  bool get isInitial => this == ProfileChangePasswordStatus.initial;
  bool get isLoading => this == ProfileChangePasswordStatus.loading;
  bool get isSuccess => this == ProfileChangePasswordStatus.success;
  bool get isFailure => this == ProfileChangePasswordStatus.failure;
}

class ProfileChangePasswordState extends Equatable {
  final ProfileChangePasswordStatus status;
  final BaseEntity? profileChangePasswordEntity;
  final String? message;
  final Failures? failures;

  const ProfileChangePasswordState({
    this.status = ProfileChangePasswordStatus.initial,
    this.profileChangePasswordEntity,
    this.message,
    this.failures,
  });

  factory ProfileChangePasswordState.initial() =>
      const ProfileChangePasswordState();

  ProfileChangePasswordState copyWith({
    ProfileChangePasswordStatus? status,
    BaseEntity? profileChangePasswordEntity,
    String? message,
    Failures? failures,
  }) {
    return ProfileChangePasswordState(
      status: status ?? this.status,
      profileChangePasswordEntity:
          profileChangePasswordEntity ?? this.profileChangePasswordEntity,
      message: message ?? this.message,
      failures: failures ?? this.failures,
    );
  }

  bool get isInitial => status.isInitial;
  bool get isLoading => status.isLoading;
  bool get isSuccess => status.isSuccess;
  bool get isFailure => status.isFailure;

  @override
  List<Object?> get props => [
        status,
        profileChangePasswordEntity,
        message,
        failures,
      ];

  @override
  bool? get stringify => true;

  @override
  String toString() {
    return 'ProfileChangePasswordState(status: $status, profileChangePasswordEntity: $profileChangePasswordEntity, message: $message,)';
  }
}

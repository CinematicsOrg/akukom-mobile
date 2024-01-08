part of 'edit_profile_bloc.dart';

enum EditProfileStatus { initial, loading, success, failure }

extension EditProfileStatusX on EditProfileStatus {
  bool get isInitial => this == EditProfileStatus.initial;
  bool get isLoading => this == EditProfileStatus.loading;
  bool get isSuccess => this == EditProfileStatus.success;
  bool get isFailure => this == EditProfileStatus.failure;
}

class EditProfileState extends Equatable {
  final EditProfileStatus status;
  final EditProfileEntity? editProfileEntity;
  final String? message;
  final Failures? failures;

  const EditProfileState({
    this.status = EditProfileStatus.initial,
    this.editProfileEntity,
    this.message,
    this.failures,
  });

  factory EditProfileState.initial() => const EditProfileState();

  EditProfileState copyWith({
    EditProfileStatus? status,
    EditProfileEntity? editProfileEntity,
    String? message,
    Failures? failures,
  }) {
    return EditProfileState(
      status: status ?? this.status,
      editProfileEntity: editProfileEntity ?? this.editProfileEntity,
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
        editProfileEntity,
        message,
        failures,
      ];

  @override
  bool? get stringify => true;

  @override
  String toString() {
    return 'EditProfileState(status: $status, editProfileEntity: $editProfileEntity, message: $message,)';
  }
}

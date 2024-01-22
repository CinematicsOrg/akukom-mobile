part of 'update_family_bloc.dart';

enum UpdateFamilyStatus {
  initial,
  loading,
  success,
  failure,
}

extension Explaination on UpdateFamilyStatus {
  bool get isInitial => this == UpdateFamilyStatus.initial;
  bool get isLoading => this == UpdateFamilyStatus.loading;
  bool get isSuccess => this == UpdateFamilyStatus.success;
  bool get isFailure => this == UpdateFamilyStatus.failure;
}

class UpdateFamilyState extends Equatable {
  final UpdateFamilyStatus status;
  final String? message;
  final dynamic data;
  final Failures? failure;

  const UpdateFamilyState({
    this.status = UpdateFamilyStatus.initial,
    this.message,
    this.data,
    this.failure,
  });

  factory UpdateFamilyState.initial() => const UpdateFamilyState();

  UpdateFamilyState copyWith({
    UpdateFamilyStatus? status,
    String? message,
    dynamic data,
    Failures? failure,
  }) {
    return UpdateFamilyState(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        data,
        failure,
      ];

  @override
  bool get stringify => true;
}

part of 'user_in_family_bloc.dart';

enum UserInFamilyStatus { initial, loading, success, failure }

extension Explaination on UserInFamilyStatus {
  bool get isInitial => this == UserInFamilyStatus.initial;
  bool get isLoading => this == UserInFamilyStatus.loading;
  bool get isSuccess => this == UserInFamilyStatus.success;
  bool get isFailure => this == UserInFamilyStatus.failure;
}

class UserInFamilyState extends Equatable {
  final UserInFamilyStatus status;
  final String? message;
  final dynamic data;
  final Failures? failure;

  const UserInFamilyState({
    this.status = UserInFamilyStatus.initial,
    this.message,
    this.data,
    this.failure,
  });

  factory UserInFamilyState.initial() => const UserInFamilyState();

  UserInFamilyState copyWith({
    UserInFamilyStatus? status,
    String? message,
    dynamic data,
    Failures? failure,
  }) {
    return UserInFamilyState(
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

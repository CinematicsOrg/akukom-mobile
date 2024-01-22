part of 'get_family_members_bloc.dart';

enum GetFamilyMembersStatus { initial, loading, success, failure }

extension Explaination on GetFamilyMembersStatus {
  bool get isInitial => this == GetFamilyMembersStatus.initial;
  bool get isLoading => this == GetFamilyMembersStatus.loading;
  bool get isSuccess => this == GetFamilyMembersStatus.success;
  bool get isFailure => this == GetFamilyMembersStatus.failure;
}

class GetFamilyMembersState extends Equatable {
  final GetFamilyMembersStatus status;
  final String? message;
  final dynamic data;
  final Failures? failure;
  const GetFamilyMembersState({
    this.status = GetFamilyMembersStatus.initial,
    this.message,
    this.data,
    this.failure,
  });

  factory GetFamilyMembersState.initial() => const GetFamilyMembersState();

  GetFamilyMembersState copyWith({
    GetFamilyMembersStatus? status,
    String? message,
    dynamic data,
    Failures? failure,
  }) {
    return GetFamilyMembersState(
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

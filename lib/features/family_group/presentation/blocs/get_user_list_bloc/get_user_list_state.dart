part of 'get_user_list_bloc.dart';

enum GetUserListStatus { initial, loading, success, failure }

extension Explaination on GetUserListStatus {
  bool get isInitial => this == GetUserListStatus.initial;
  bool get isLoading => this == GetUserListStatus.loading;
  bool get isSuccess => this == GetUserListStatus.success;
  bool get isFailure => this == GetUserListStatus.failure;
}

class GetUserListState extends Equatable {
  final GetUserListStatus status;
  final String? message;
  final UserListEntity? data;
  final List<UsersListDocEntity>? usersList;
  final Failures? failure;
  const GetUserListState({
    this.status = GetUserListStatus.initial,
    this.message,
    this.data,
    this.failure,
    this.usersList,
  });

  factory GetUserListState.initial() => const GetUserListState();

  GetUserListState copyWith({
    GetUserListStatus? status,
    String? message,
    UserListEntity? data,
    Failures? failure,
    List<UsersListDocEntity>? usersList,
  }) {
    return GetUserListState(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      failure: failure ?? this.failure,
      usersList: usersList ?? this.usersList,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        data,
        failure,
        usersList,
      ];
}

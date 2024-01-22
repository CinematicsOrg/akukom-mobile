part of 'get_family_family_user_can_join_bloc.dart';

enum GetFamilyFamilyUserCanJoinStatus { initial, loading, success, failure }

extension GetFamilyFamilyUserCanJoinStatusX on GetFamilyFamilyUserCanJoinStatus {
  bool get isInitial => this == GetFamilyFamilyUserCanJoinStatus.initial;
  bool get isLoading => this == GetFamilyFamilyUserCanJoinStatus.loading;
  bool get isSuccess => this == GetFamilyFamilyUserCanJoinStatus.success;
  bool get isFailure => this == GetFamilyFamilyUserCanJoinStatus.failure;
}

class GetFamilyFamilyUserCanJoinState extends Equatable {
  final GetFamilyFamilyUserCanJoinStatus status;
  final String? message;
  final FamilyUserCanJoinEntity? data;
  final List<FamilyDataEntity>? familyList;

  final Failures? failure;

  const GetFamilyFamilyUserCanJoinState({
    this.status = GetFamilyFamilyUserCanJoinStatus.initial,
    this.message,
    this.data,
    this.failure,
    this.familyList,
  });

  factory GetFamilyFamilyUserCanJoinState.initial() =>
      const GetFamilyFamilyUserCanJoinState();

  GetFamilyFamilyUserCanJoinState copyWith({
    GetFamilyFamilyUserCanJoinStatus? status,
    String? message,
    FamilyUserCanJoinEntity? data,
    Failures? failure,
    List<FamilyDataEntity>? familyList,
  }) {
    return GetFamilyFamilyUserCanJoinState(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      failure: failure ?? this.failure,
      familyList: familyList ?? this.familyList,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        data,
        failure,
        familyList,
      ];

  @override
  bool get stringify => true;
}

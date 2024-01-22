part of 'get_user_family_bloc.dart';

enum GetUserFamilyStatus { initial, loading, success, failure }

extension Explaination on GetUserFamilyStatus {
  bool get isInitial => this == GetUserFamilyStatus.initial;
  bool get isLoading => this == GetUserFamilyStatus.loading;
  bool get isSuccess => this == GetUserFamilyStatus.success;
  bool get isFailure => this == GetUserFamilyStatus.failure;
}

class GetUserFamilyState extends Equatable {
  final GetUserFamilyStatus status;
  final String? message;
  final UserFamilyListEntity? data;
  final List<FamilyDataEntity>? familyData;
  final Failures? failure;
  const GetUserFamilyState({
    this.status = GetUserFamilyStatus.initial,
    this.message,
    this.data,
    this.familyData,
    this.failure,
  });

  factory GetUserFamilyState.initial() => const GetUserFamilyState();

  GetUserFamilyState copyWith({
    GetUserFamilyStatus? status,
    String? message,
    UserFamilyListEntity? data,
    List<FamilyDataEntity>? familyData,
    Failures? failure,
  }) {
    return GetUserFamilyState(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      familyData: familyData ?? this.familyData,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        data,
        failure,
        familyData,
      ];
}

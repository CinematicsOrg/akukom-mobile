part of 'family_user_can_join_bloc.dart';

enum FamilyUserCanJoinStatus { initial, loading, success, failure }

extension FamilyUserCanJoinStatusX on FamilyUserCanJoinStatus {
  bool get isInitial => this == FamilyUserCanJoinStatus.initial;
  bool get isLoading => this == FamilyUserCanJoinStatus.loading;
  bool get isSuccess => this == FamilyUserCanJoinStatus.success;
  bool get isFailure => this == FamilyUserCanJoinStatus.failure;
}

class FamilyUserCanJoinState extends Equatable {
  final FamilyUserCanJoinStatus status;
  final String? message;
  final dynamic data;
  const FamilyUserCanJoinState({
    this.status = FamilyUserCanJoinStatus.initial,
    this.message,
    this.data,
  });

  factory FamilyUserCanJoinState.initial() {
    return const FamilyUserCanJoinState();
  }

  FamilyUserCanJoinState copyWith({
    FamilyUserCanJoinStatus? status,
    String? message,
    dynamic data,
  }) {
    return FamilyUserCanJoinState(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [];
}

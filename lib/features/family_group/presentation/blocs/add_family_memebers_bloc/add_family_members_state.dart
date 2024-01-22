part of 'add_family_members_bloc.dart';

enum AddFamilyMembersStatus {
  initial,
  loading,
  success,
  failure,
}

extension Explaination on AddFamilyMembersStatus {
  bool get isInitial => this == AddFamilyMembersStatus.initial;
  bool get isLoading => this == AddFamilyMembersStatus.loading;
  bool get isSuccess => this == AddFamilyMembersStatus.success;
  bool get isFailure => this == AddFamilyMembersStatus.failure;
}

class AddFamilyMembersState extends Equatable {
  final AddFamilyMembersStatus status;
  final String? message;
  final dynamic data;
  final Failures? failure;

  const AddFamilyMembersState({
    this.status = AddFamilyMembersStatus.initial,
    this.message,
    this.data,
    this.failure,
  });

  factory AddFamilyMembersState.initial() => const AddFamilyMembersState();

  AddFamilyMembersState copyWith({
    AddFamilyMembersStatus? status,
    String? message,
    dynamic data,
    Failures? failure,
  }) {
    return AddFamilyMembersState(
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

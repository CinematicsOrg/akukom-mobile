part of 'get_family_details_bloc.dart';

enum GetFamilyDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

extension Explaination on GetFamilyDetailsStatus {
  bool get isInitial => this == GetFamilyDetailsStatus.initial;
  bool get isLoading => this == GetFamilyDetailsStatus.loading;
  bool get isSuccess => this == GetFamilyDetailsStatus.success;
  bool get isFailure => this == GetFamilyDetailsStatus.failure;
}

class GetFamilyDetailsState extends Equatable {
  final GetFamilyDetailsStatus status;
  final String? message;
  final dynamic data;
  final Failures? failure;
  const GetFamilyDetailsState({
    this.status = GetFamilyDetailsStatus.initial,
    this.message,
    this.data,
    this.failure,
  });

  factory GetFamilyDetailsState.initial() => const GetFamilyDetailsState();

  GetFamilyDetailsState copyWith({
    GetFamilyDetailsStatus? status,
    String? message,
    dynamic data,
    Failures? failure,
  }) {
    return GetFamilyDetailsState(
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

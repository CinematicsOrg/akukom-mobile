part of 'requests_to_join_family_bloc.dart';

enum RequestsToJoinFamilyStatus { initial, loading, success, failure }

extension RequestsToJoinFamilyStatusX on RequestsToJoinFamilyStatus {
  bool get isInitial => this == RequestsToJoinFamilyStatus.initial;
  bool get isLoading => this == RequestsToJoinFamilyStatus.loading;
  bool get isSuccess => this == RequestsToJoinFamilyStatus.success;
  bool get isFailure => this == RequestsToJoinFamilyStatus.failure;
}

class RequestsToJoinFamilyState extends Equatable {
  final RequestsToJoinFamilyStatus status;
  final String? message;
  final dynamic data;
  final Failures? failure;
  const RequestsToJoinFamilyState({
    this.status = RequestsToJoinFamilyStatus.initial,
    this.message,
    this.data,
    this.failure,
  });

  factory RequestsToJoinFamilyState.initial() =>
      const RequestsToJoinFamilyState();

  RequestsToJoinFamilyState copyWith({
    RequestsToJoinFamilyStatus? status,
    String? message,
    dynamic data,
    Failures? failure,
  }) {
    return RequestsToJoinFamilyState(
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

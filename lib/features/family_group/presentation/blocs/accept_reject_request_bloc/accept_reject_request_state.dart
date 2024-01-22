part of 'accept_reject_request_bloc.dart';

enum AcceptRejectRequestStatus {
  initial,
  loading,
  success,
  failure,
}

extension Explaination on AcceptRejectRequestStatus {
  bool get isInitial => this == AcceptRejectRequestStatus.initial;
  bool get isLoading => this == AcceptRejectRequestStatus.loading;
  bool get isSuccess => this == AcceptRejectRequestStatus.success;
  bool get isFailure => this == AcceptRejectRequestStatus.failure;
}

class AcceptRejectRequestState extends Equatable {
  final AcceptRejectRequestStatus status;
  final String? message;
  final dynamic data;
  final Failures? failure;

  const AcceptRejectRequestState({
    this.status = AcceptRejectRequestStatus.initial,
    this.message,
    this.data,
    this.failure,
  });

  factory AcceptRejectRequestState.initial() =>
      const AcceptRejectRequestState();

  AcceptRejectRequestState copyWith({
    AcceptRejectRequestStatus? status,
    String? message,
    dynamic data,
    Failures? failure,
  }) {
    return AcceptRejectRequestState(
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

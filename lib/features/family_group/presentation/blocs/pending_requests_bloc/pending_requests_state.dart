part of 'pending_requests_bloc.dart';

enum PendingRequestsStatus {
  initial,
  loading,
  success,
  failure,
}

extension Explaination on PendingRequestsStatus {
  bool get isInitial => this == PendingRequestsStatus.initial;
  bool get isLoading => this == PendingRequestsStatus.loading;
  bool get isSuccess => this == PendingRequestsStatus.success;
  bool get isFailure => this == PendingRequestsStatus.failure;
}

class PendingRequestsState extends Equatable {
  final PendingRequestsStatus status;
  final String? message;
  final dynamic data;
  final Failures? failure;
  const PendingRequestsState({
    this.status = PendingRequestsStatus.initial,
    this.message,
    this.data,
    this.failure,
  });

  factory PendingRequestsState.initial() => const PendingRequestsState();

  PendingRequestsState copyWith({
    PendingRequestsStatus? status,
    String? message,
    dynamic data,
    Failures? failure,
  }) {
    return PendingRequestsState(
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



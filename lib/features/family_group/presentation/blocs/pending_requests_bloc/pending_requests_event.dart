part of 'pending_requests_bloc.dart';

abstract class PendingRequestsEvent extends Equatable {
  const PendingRequestsEvent();

  @override
  List<Object> get props => [];
}

class PendingRequestsUserEvent extends PendingRequestsEvent {
  final dynamic param;

  const PendingRequestsUserEvent({
    required this.param,
  });

  @override
  List<Object> get props => [
        param,
      ];
}

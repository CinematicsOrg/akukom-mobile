part of 'accept_reject_request_bloc.dart';

abstract class AcceptRejectRequestEvent extends Equatable {
  const AcceptRejectRequestEvent();

  @override
  List<Object> get props => [];
}

class AcceptRejectRequestUserEvent extends AcceptRejectRequestEvent {
  final dynamic param;
  
  const AcceptRejectRequestUserEvent({
    required this.param,
  });

  @override
  List<Object> get props => [
        param,
      ];
}

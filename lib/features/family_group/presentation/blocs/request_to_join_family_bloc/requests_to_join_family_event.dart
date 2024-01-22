part of 'requests_to_join_family_bloc.dart';

abstract class RequestsToJoinFamilyEvent extends Equatable {
  const RequestsToJoinFamilyEvent();

  @override
  List<Object> get props => [];
}

class RequestsToJoinFamilyUserEvent extends RequestsToJoinFamilyEvent {
  final dynamic param;

  const RequestsToJoinFamilyUserEvent({
    required this.param,
  });

  @override
  List<Object> get props => [
        param,
      ];
}

part of 'get_family_members_bloc.dart';

abstract class GetFamilyMembersEvent extends Equatable {
  const GetFamilyMembersEvent();

  @override
  List<Object> get props => [];
}

class GetFamilyMembersUserEvent extends GetFamilyMembersEvent {
  final dynamic param;

  const GetFamilyMembersUserEvent({
    required this.param,
  });

  @override
  List<Object> get props => [
        param,
      ];
}

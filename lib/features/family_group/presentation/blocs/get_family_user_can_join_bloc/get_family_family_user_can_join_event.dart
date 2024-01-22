part of 'get_family_family_user_can_join_bloc.dart';

abstract class GetFamilyFamilyUserCanJoinEvent extends Equatable {
  const GetFamilyFamilyUserCanJoinEvent();

  @override
  List<Object> get props => [];
}

class GetFamilyFamilyUserCanJoinUserEvent extends GetFamilyFamilyUserCanJoinEvent {
  final ListFamilyUserCanJoinParam param;

  const GetFamilyFamilyUserCanJoinUserEvent({
    required this.param,
  });

  @override
  List<Object> get props => [
        param,
      ];
}

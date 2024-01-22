part of 'family_user_can_join_bloc.dart';

abstract class FamilyUserCanJoinEvent extends Equatable {
  const FamilyUserCanJoinEvent();

  @override
  List<Object> get props => [];
}

class GetFamilyListUserCanJoinEvent extends FamilyUserCanJoinEvent {
  final dynamic param;

  const GetFamilyListUserCanJoinEvent({
    required this.param,
  });

  @override
  List<Object> get props => [
        param,
      ];
}

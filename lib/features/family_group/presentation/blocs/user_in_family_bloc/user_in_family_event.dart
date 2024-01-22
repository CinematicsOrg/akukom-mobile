part of 'user_in_family_bloc.dart';

abstract class UserInFamilyEvent extends Equatable {
  const UserInFamilyEvent();

  @override
  List<Object> get props => [];
}

class UserInFamilyUserEvent extends UserInFamilyEvent {
  final dynamic param;

  const UserInFamilyUserEvent({
    required this.param,
  });

  @override
  List<Object> get props => [
        param,
      ];
}

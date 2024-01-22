part of 'profile_change_password_bloc.dart';

abstract class ProfileChangePasswordEvent extends Equatable {
  const ProfileChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class ProfileUserChangePasswordEvent extends ProfileChangePasswordEvent {
  final ProfileChangePasswordParam params;

  const ProfileUserChangePasswordEvent({
    required this.params,
  });

  @override
  List<Object> get props => [params];
}

part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfileEvent extends EditProfileEvent {
  final RequestParam params;

  const UpdateProfileEvent({
    required this.params,
  });

  @override
  List<Object> get props => [params];
}

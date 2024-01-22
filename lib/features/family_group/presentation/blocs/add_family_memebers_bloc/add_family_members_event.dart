part of 'add_family_members_bloc.dart';

abstract class AddFamilyMembersEvent extends Equatable {
  const AddFamilyMembersEvent();

  @override
  List<Object> get props => [];
}

class AddFamilyMembersUserEvent extends AddFamilyMembersEvent {
  final dynamic param;

  const AddFamilyMembersUserEvent({
    required this.param,
  });

  @override
  List<Object> get props => [
        param,
      ];
}

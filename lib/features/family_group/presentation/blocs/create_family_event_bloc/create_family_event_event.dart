part of 'create_family_event_bloc.dart';

abstract class CreateFamilyEventEvent extends Equatable {
  const CreateFamilyEventEvent();

  @override
  List<Object> get props => [];
}

class CreateFamilysEvent extends CreateFamilyEventEvent {
  final CreateFamilyEventsParams params;

  const CreateFamilysEvent({required this.params});

  @override
  List<Object> get props => [params];
}

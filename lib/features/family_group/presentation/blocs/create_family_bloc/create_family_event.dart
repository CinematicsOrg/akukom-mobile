part of 'create_family_bloc.dart';

abstract class CreateFamilyEvent extends Equatable {
  const CreateFamilyEvent();

  @override
  List<Object> get props => [];
}

class CreateFamilyUserEvent extends CreateFamilyEvent {
  final dynamic param;
  
  const CreateFamilyUserEvent({
    required this.param,
  });

  @override
  List<Object> get props => [
        param,
      ];
}

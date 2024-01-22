part of 'update_family_bloc.dart';

abstract class UpdateFamilyEvent extends Equatable {
  const UpdateFamilyEvent();

  @override
  List<Object> get props => [];
}

class UpdateFamilyUserEvent extends UpdateFamilyEvent {
  final dynamic param;

  const UpdateFamilyUserEvent({
    required this.param,
  });

  @override
  List<Object> get props => [
        param,
      ];
}

part of 'get_user_family_bloc.dart';

abstract class GetUserFamilyEvent extends Equatable {
  const GetUserFamilyEvent();

  @override
  List<Object> get props => [];
}

class GetUserFamilyUserEvent extends GetUserFamilyEvent {
  final dynamic param;

  const GetUserFamilyUserEvent({
    required this.param,
  });

  @override
  List<Object> get props => [
        param,
      ];
}

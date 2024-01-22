part of 'get_user_list_bloc.dart';

abstract class GetUserListEvent extends Equatable {
  const GetUserListEvent();

  @override
  List<Object> get props => [];
}

class GetUserListUserEvent extends GetUserListEvent {
  final GetUsersParam param;

  const GetUserListUserEvent({
    required this.param,
  });

  @override
  List<Object> get props => [
        param,
      ];
}

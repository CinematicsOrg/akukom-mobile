part of 'change_password_bloc.dart';

class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class ChangePasswordButtonPressed extends ChangePasswordEvent {
  final RequestParam param;

  const ChangePasswordButtonPressed({
    required this.param,
  });

  @override
  List<Object> get props => [param];
}

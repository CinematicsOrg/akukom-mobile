part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupButtonPressed extends SignupEvent {
  final RequestParam param;

  const SignupButtonPressed({
    required this.param,
  });

  @override
  List<Object> get props => [param];
}


part of 'signin_bloc.dart';

class SigninEvent extends Equatable {
  const SigninEvent();

  @override
  List<Object> get props => [];
}

class SigninButtonPressed extends SigninEvent {
  final RequestParam param;

  const SigninButtonPressed({
    required this.param,
  });

  @override
  List<Object> get props => [param];
}



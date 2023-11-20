part of 'complete_signup_bloc.dart';

sealed class CompleteSignupEvent extends Equatable {
  const CompleteSignupEvent();

  @override
  List<Object> get props => [];
}

class CompleteSignupButtonPressed extends CompleteSignupEvent {
  final RequestParam param;

  const CompleteSignupButtonPressed({
    required this.param,
  });

  @override
  List<Object> get props => [param];
}

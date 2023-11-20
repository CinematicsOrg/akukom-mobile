part of 'verify_phone_bloc.dart';

sealed class VerifyPhoneEvent extends Equatable {
  const VerifyPhoneEvent();

  @override
  List<Object> get props => [];
}

class VerifyPhoneButtonEvent extends VerifyPhoneEvent {
  final RequestParam param;

  const VerifyPhoneButtonEvent({
    required this.param,
  });

  @override
  List<Object> get props => [param];
}

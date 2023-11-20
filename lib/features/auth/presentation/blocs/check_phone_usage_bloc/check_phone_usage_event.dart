part of 'check_phone_usage_bloc.dart';

sealed class CheckPhoneUsageEvent extends Equatable {
  const CheckPhoneUsageEvent();

  @override
  List<Object> get props => [];
}

class CheckPhoneUsageEventStarted extends CheckPhoneUsageEvent {
  final RequestParam param;

  const CheckPhoneUsageEventStarted({
    required this.param,
  });

  @override
  List<Object> get props => [param];
}

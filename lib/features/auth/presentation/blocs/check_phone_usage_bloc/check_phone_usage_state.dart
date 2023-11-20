part of 'check_phone_usage_bloc.dart';

enum CheckPhoneUsageStatus { initial, loading, success, failure }

extension CheckPhoneUsageStatusX on CheckPhoneUsageStatus {
  bool get isInitial => this == CheckPhoneUsageStatus.initial;
  bool get isLoading => this == CheckPhoneUsageStatus.loading;
  bool get isSuccess => this == CheckPhoneUsageStatus.success;
  bool get isFailure => this == CheckPhoneUsageStatus.failure;
}

class CheckPhoneUsageState extends Equatable {
  final CheckPhoneUsageStatus status;
  final BaseEntity? baseEntity;
  final Failures? failures;

  const CheckPhoneUsageState({
    this.status = CheckPhoneUsageStatus.initial,
    this.baseEntity,
    this.failures,
  });

  factory CheckPhoneUsageState.initial() => const CheckPhoneUsageState();

  CheckPhoneUsageState copyWith({
    CheckPhoneUsageStatus? status,
    BaseEntity? baseEntity,
    Failures? failures,
  }) {
    return CheckPhoneUsageState(
      status: status ?? this.status,
      baseEntity: baseEntity ?? this.baseEntity,
      failures: failures ?? this.failures,
    );
  }

  @override
  List<Object?> get props => [
        status,
        baseEntity,
        failures,
      ];

  @override
  String toString() {
    return '''CheckPhoneUsageState {
      status: $status,
      baseEntity: $baseEntity,
      failures: $failures,
    }''';
  }
}
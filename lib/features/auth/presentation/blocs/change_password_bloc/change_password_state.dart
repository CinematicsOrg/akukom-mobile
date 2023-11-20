part of 'change_password_bloc.dart';

enum ChangePasswordStatus { initial, loading, failure, success }

extension ChangePasswordStatusX on ChangePasswordStatus {
  bool get isInitial => this == ChangePasswordStatus.initial;
  bool get isLoading => this == ChangePasswordStatus.loading;
  bool get isFailure => this == ChangePasswordStatus.failure;
  bool get isSuccess => this == ChangePasswordStatus.success;
}

class ChangePasswordState extends Equatable {
  final ChangePasswordStatus status;
  final Failures? failures;
  final BaseEntity? data;

  const ChangePasswordState({
    this.status = ChangePasswordStatus.initial,
    this.failures,
    this.data,
  });

  factory ChangePasswordState.initial() => const ChangePasswordState();

  ChangePasswordState copyWith({
    ChangePasswordStatus? status,
    Failures? failures,
    BaseEntity? data,
  }) {
    return ChangePasswordState(
      status: status ?? this.status,
      failures: failures ?? this.failures,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [
        status,
        failures,
        data,
      ];

  @override
  String toString() {
    return '''ChangePasswordState {
      status: $status,
      failures: $failures,
      data: $data,
    }''';
  }
}

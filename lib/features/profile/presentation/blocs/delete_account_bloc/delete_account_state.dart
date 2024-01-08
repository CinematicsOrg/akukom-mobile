part of 'delete_account_bloc.dart';

enum DeleteAccountStatus { initial, loading, success, failure }

extension DeleteAccountStatusX on DeleteAccountStatus {
  bool get isInitial => this == DeleteAccountStatus.initial;
  bool get isLoading => this == DeleteAccountStatus.loading;
  bool get isSuccess => this == DeleteAccountStatus.success;
  bool get isFailure => this == DeleteAccountStatus.failure;
}

class DeleteAccountState extends Equatable {
  final DeleteAccountStatus status;
  final BaseEntity? deleteAccountEntity;
  final String? message;
  final Failures? failures;

  const DeleteAccountState({
    this.status = DeleteAccountStatus.initial,
    this.deleteAccountEntity,
    this.message,
    this.failures,
  });

  factory DeleteAccountState.initial() => const DeleteAccountState();

  DeleteAccountState copyWith({
    DeleteAccountStatus? status,
    BaseEntity? deleteAccountEntity,
    String? message,
    Failures? failures,
  }) {
    return DeleteAccountState(
      status: status ?? this.status,
      deleteAccountEntity: deleteAccountEntity ?? this.deleteAccountEntity,
      message: message ?? this.message,
      failures: failures ?? this.failures,
    );
  }

  bool get isInitial => status.isInitial;
  bool get isLoading => status.isLoading;
  bool get isSuccess => status.isSuccess;
  bool get isFailure => status.isFailure;

  @override
  List<Object?> get props => [
        status,
        deleteAccountEntity,
        message,
        failures,
      ];

  @override
  bool? get stringify => true;

  @override
  String toString() {
    return 'DeleteAccountState(status: $status, deleteAccountEntity: $deleteAccountEntity, message: $message,)';
  }
}

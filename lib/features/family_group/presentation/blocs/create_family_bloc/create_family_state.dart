part of 'create_family_bloc.dart';

enum CreateFamilyStatus { initial, loading, success, failure }

extension CreateFamilyStatusX on CreateFamilyStatus {
  bool get isInitial => this == CreateFamilyStatus.initial;
  bool get isLoading => this == CreateFamilyStatus.loading;
  bool get isSuccess => this == CreateFamilyStatus.success;
  bool get isFailure => this == CreateFamilyStatus.failure;
}

class CreateFamilyState extends Equatable {
  final CreateFamilyStatus status;
  final String? message;
  final CreateFamilyEntity? data;

  const CreateFamilyState({
    this.status = CreateFamilyStatus.initial,
    this.message,
    this.data,
  });

  factory CreateFamilyState.initial() {
    return const CreateFamilyState();
  }

  CreateFamilyState copyWith({
    CreateFamilyStatus? status,
    String? message,
    CreateFamilyEntity? data,
  }) {
    return CreateFamilyState(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        data,
      ];

  @override
  bool get stringify => true;
}

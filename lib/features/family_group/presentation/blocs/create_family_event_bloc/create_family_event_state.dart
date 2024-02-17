part of 'create_family_event_bloc.dart';

enum CreateFamilyEventStateStatus { initial, loading, loaded, error }

extension CreateFamilyEventStateStatusX on CreateFamilyEventStateStatus {
  bool get isInitial => this == CreateFamilyEventStateStatus.initial;
  bool get isLoading => this == CreateFamilyEventStateStatus.loading;
  bool get isLoaded => this == CreateFamilyEventStateStatus.loaded;
  bool get isError => this == CreateFamilyEventStateStatus.error;
}

class CreateFamilyEventState extends Equatable {
  final CreateFamilyEventStateStatus status;
  final Failures? failure;

  const CreateFamilyEventState({
    required this.status,
    required this.failure,
  });

  factory CreateFamilyEventState.initial() {
    return const CreateFamilyEventState(
      status: CreateFamilyEventStateStatus.initial,
      failure: null,
    );
  }

  CreateFamilyEventState copyWith({
    CreateFamilyEventStateStatus? status,
    Failures? failure,
  }) {
    return CreateFamilyEventState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        failure,
      ];

  @override
  bool get stringify => true;
}

part of 'get_family_events_bloc.dart';

enum GetFamilyEventsStateStatus { initial, loading, loaded, error }

extension GetFamilyEventsStateStatusX on GetFamilyEventsStateStatus {
  bool get isInitial => this == GetFamilyEventsStateStatus.initial;
  bool get isLoading => this == GetFamilyEventsStateStatus.loading;
  bool get isLoaded => this == GetFamilyEventsStateStatus.loaded;
  bool get isError => this == GetFamilyEventsStateStatus.error;
}

class GetFamilyEventsState extends Equatable {
  final GetFamilyEventsStateStatus status;
  final FamilyEventListEntity? familyEventData;
  final List<EventsEntity>? familyEvents;
  final Failures? failure;

  const GetFamilyEventsState({
    required this.status,
    required this.familyEvents,
    required this.familyEventData,
    required this.failure,
  });

  factory GetFamilyEventsState.initial() {
    return const GetFamilyEventsState(
      status: GetFamilyEventsStateStatus.initial,
      familyEventData: null,
      familyEvents: null,
      failure: null,
    );
  }

  GetFamilyEventsState copyWith({
    GetFamilyEventsStateStatus? status,
    FamilyEventListEntity? familyEventData,
    List<EventsEntity>? familyEvents,
    Failures? failure,
  }) {
    return GetFamilyEventsState(
      status: status ?? this.status,
      familyEvents: familyEvents ?? this.familyEvents,
      familyEventData: familyEventData ?? this.familyEventData,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        familyEvents,
        familyEventData,
        failure,
      ];

  @override
  bool get stringify => true;
}

import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/utils/formz_validator/__forms.dart';
import 'package:akukom/cores/utils/helper_functions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventCubit extends Cubit<CreateEventState> {
  CreateEventCubit() : super(CreateEventState.initial());

  void eventNameChanged(String value) {
    final eventName = Required.dirty(value);
    emit(state.copyWith(eventName: eventName));
  }

  void eventLocationChanged(String value) {
    final eventLocation = Required.dirty(value);
    emit(state.copyWith(eventLocation: eventLocation));
  }

  void eventStartDateChanged(DateTime? value) {
    final eventStartDate = RequiredDateTime.dirty(value);
    emit(state.copyWith(eventStartDate: eventStartDate));
  }

  void eventEndDateChanged(DateTime? value) {
    final eventEndDate = RequiredDateTime.dirty(value);
    emit(state.copyWith(eventEndDate: eventEndDate));
  }

  void eventImageChanged(XFile? value) {
    final eventImage = RequiredXFile.dirty(value);
    emit(state.copyWith(eventImage: eventImage));
  }

  void addADefaultImage() async {
    final eventImage = RequiredXFile.dirty(
      await assetToXFile(AppImages.createEventDefault),
    );
    emit(state.copyWith(eventImage: eventImage));
  }

  void resetForm() {
    emit(CreateEventState.initial());
  }
}

class CreateEventState extends Equatable with FormzMixin {
  final Required eventName;
  final Required eventLocation;
  final RequiredDateTime eventStartDate;
  final RequiredDateTime eventEndDate;
  final RequiredXFile eventImage;

  const CreateEventState({
    this.eventName = const Required.pure(),
    this.eventLocation = const Required.pure(),
    this.eventEndDate = const RequiredDateTime.pure(),
    this.eventStartDate = const RequiredDateTime.pure(),
    this.eventImage = const RequiredXFile.pure(),
  });

  factory CreateEventState.initial() {
    return const CreateEventState(
      eventName: Required.pure(),
      eventLocation: Required.pure(),
      eventStartDate: RequiredDateTime.pure(),
      eventEndDate: RequiredDateTime.pure(),
      eventImage: RequiredXFile.pure(),
    );
  }

  CreateEventState copyWith({
    Required? eventName,
    Required? eventLocation,
    RequiredDateTime? eventStartDate,
    RequiredDateTime? eventEndDate,
    RequiredXFile? eventImage,
  }) {
    return CreateEventState(
      eventName: eventName ?? this.eventName,
      eventLocation: eventLocation ?? this.eventLocation,
      eventStartDate: eventStartDate ?? this.eventStartDate,
      eventEndDate: eventEndDate ?? this.eventEndDate,
      eventImage: eventImage ?? this.eventImage,
    );
  }

  @override
  List<Object?> get props => [
        eventName,
        eventLocation,
        eventStartDate,
        eventEndDate,
        eventImage,
      ];

  @override
  bool get stringify => true;

  @override
  List<FormzInput> get inputs => [
        eventName,
        eventLocation,
        eventStartDate,
        eventEndDate,
        eventImage,
      ];
}

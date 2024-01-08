import 'package:akukom/cores/utils/formz_validator/__forms.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileCubitState> {
  EditProfileCubit() : super(EditProfileCubitState.initial());

  void firstNameChanged(String value) {
    final firstName = Required.dirty(value);
    emit(state.copyWith(
      firstName: firstName,
    ));
  }

  void lastNameChanged(String value) {
    final lastName = Required.dirty(value);
    emit(state.copyWith(
      lastName: lastName,
    ));
  }

  void countryChanged(String value) {
    final country = Required.dirty(value);
    emit(state.copyWith(
      country: country,
    ));
  }

  void tribeChanged(String value) {
    final tribe = Required.dirty(value);
    emit(state.copyWith(
      tribe: tribe,
    ));
  }

  void emailChanged(String value) {
    final email = Required.dirty(value);
    emit(state.copyWith(
      email: email,
    ));
  }

  void changeStatus(EditProfileCubitStatus status) {
    emit(state.copyWith(
      status: status,
    ));
  }

  void reset() {
    emit(EditProfileCubitState.initial());
  }
}

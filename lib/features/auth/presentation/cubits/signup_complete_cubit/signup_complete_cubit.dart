import 'package:akukom/cores/utils/formz_validator/__forms.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_complete_state.dart';

class SignupCompleteCubit extends Cubit<SignupCompleteState> {
  SignupCompleteCubit() : super(SignupCompleteState.initial());

  void phoneChanged(String value) {
    final phone = Required.dirty(value);
    emit(state.copyWith(
      phone: phone,
    ));
  }

  void countryOfResidenceChanged(String value) {
    final countryOfResidence = Required.dirty(value);
    emit(state.copyWith(
      countryOfResidence: countryOfResidence,
    ));
  }

  void countryPhoneCodeChanged(String value) {
    final countryPhoneCode = Required.dirty(value);
    emit(
      state.copyWith(countryPhoneCode: countryPhoneCode),
    );
  }

  void tribeChanged(String value) {
    final tribe = Required.dirty(value);
    emit(
      state.copyWith(tribe: tribe),
    );
  }

  void reset() {
    emit(SignupCompleteState.initial());
  }
}

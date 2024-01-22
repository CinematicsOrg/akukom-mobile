import 'package:akukom/cores/utils/formz_validator/__forms.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

class CreateFamilyFormCubit extends Cubit<CreateFamilyFormState> {
  CreateFamilyFormCubit() : super(CreateFamilyFormState.initial());

  void familyNameChanged(String value) {
    final familyName = Required.dirty(value);
    emit(state.copyWith(
      familyName: familyName,
      isValid: _isFormValid(
          familyName: familyName,
          familyDescription: state.familyDescription,
          image: state.familyImage),
    ));
  }

  void familyDescriptionChanged(String value) {
    final familyDescription = Required.dirty(value);
    emit(state.copyWith(
      familyDescription: familyDescription,
      isValid: _isFormValid(
          familyName: state.familyName,
          familyDescription: familyDescription,
          image: state.familyImage),
    ));
  }

  void familyImageChanged(XFile? value) {
    emit(
      state.copyWith(
        familyImage: value,
        isValid: _isFormValid(
            image: value,
            familyName: state.familyName,
            familyDescription: state.familyDescription),
      ),
    );
  }

  bool _isFormValid({
    Required? familyName,
    Required? familyDescription,
    XFile? image,
  }) {
    return familyName?.isValid == true &&
        familyDescription?.isValid == true &&
        image != null;
  }
}

class CreateFamilyFormState extends Equatable {
  final Required? familyName;
  final Required familyDescription;
  final XFile? familyImage;
  final bool isValid;

  const CreateFamilyFormState({
    this.familyName = const Required.pure(),
    this.familyDescription = const Required.pure(),
    this.familyImage,
    this.isValid = false,
  });

  factory CreateFamilyFormState.initial() {
    return const CreateFamilyFormState();
  }

  CreateFamilyFormState copyWith({
    Required? familyName,
    Required? familyDescription,
    XFile? familyImage,
    bool? isValid,
  }) {
    return CreateFamilyFormState(
      familyName: familyName ?? this.familyName,
      familyDescription: familyDescription ?? this.familyDescription,
      familyImage: familyImage ?? this.familyImage,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        familyName,
        familyDescription,
        familyImage,
        isValid,
      ];
}

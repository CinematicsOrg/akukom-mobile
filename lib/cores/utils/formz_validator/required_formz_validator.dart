import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

enum RequiredValidationError { invalid }

class Required extends FormzInput<String, RequiredValidationError> {
  const Required.pure([String value = '']) : super.pure(value);
  const Required.dirty([String value = '']) : super.dirty(value);

  @override
  RequiredValidationError? validator(String value) {
    if (value.isNotEmpty) {
      return null;
    } else {
      return RequiredValidationError.invalid;
    }
  }
}

class RequiredDouble extends FormzInput<double, RequiredValidationError> {
  const RequiredDouble.pure([double value = 0]) : super.pure(value);
  const RequiredDouble.dirty([double value = 0]) : super.dirty(value);

  @override
  RequiredValidationError? validator(double value) {
    if (value != 0) {
      return null;
    } else {
      return RequiredValidationError.invalid;
    }
  }
}

class RequiredInt extends FormzInput<int, RequiredValidationError> {
  const RequiredInt.pure([int value = 0]) : super.pure(value);
  const RequiredInt.dirty([int value = 0]) : super.dirty(value);

  @override
  RequiredValidationError? validator(int value) {
    if (value != 0) {
      return null;
    } else {
      return RequiredValidationError.invalid;
    }
  }
}

class RequiredBool extends FormzInput<bool, RequiredValidationError> {
  const RequiredBool.pure([bool value = false]) : super.pure(value);
  const RequiredBool.dirty([bool value = false]) : super.dirty(value);

  @override
  RequiredValidationError? validator(bool value) {
    if (value == true) {
      return null;
    } else {
      return RequiredValidationError.invalid;
    }
  }
}

class RequiredDateTime extends FormzInput<DateTime?, RequiredValidationError> {
  const RequiredDateTime.pure([DateTime? value]) : super.pure(value);
  const RequiredDateTime.dirty([DateTime? value]) : super.dirty(value);

  @override
  RequiredValidationError? validator(DateTime? value) {
    if (value != null) {
      return null; // Valid
    } else {
      return RequiredValidationError.invalid; // Invalid
    }
  }
}

class RequiredXFile extends FormzInput<XFile?, RequiredValidationError> {
  const RequiredXFile.pure([XFile? value]) : super.pure(value);
  const RequiredXFile.dirty([XFile? value]) : super.dirty(value);

  @override
  RequiredValidationError? validator(XFile? value) {
    if (value != null) {
      return null; // Valid
    } else {
      return RequiredValidationError.invalid; // Invalid
    }
  }
}

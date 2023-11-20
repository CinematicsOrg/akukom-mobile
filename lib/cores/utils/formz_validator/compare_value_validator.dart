import 'package:formz/formz.dart';

enum CompareValueValidationError { invalid }

class CompareValue extends FormzInput<String, CompareValueValidationError> {
  final String compareTo;

  const CompareValue.pure({String value = '', this.compareTo = ''})
      : super.pure(value);
  const CompareValue.dirty({String value = '', required this.compareTo})
      : super.dirty(value);

  @override
  CompareValueValidationError? validator(String value) {
    if (value.isEmpty || compareTo.isEmpty) {
      return CompareValueValidationError.invalid;
    }
    return value == compareTo ? null : CompareValueValidationError.invalid;
  }
}

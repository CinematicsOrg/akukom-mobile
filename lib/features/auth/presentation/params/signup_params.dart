// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:akukom/cores/base_request_body/base_request_body.dart';

class SignUpParams extends RequestParam {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  SignUpParams({
   required this.firstName,
   required this.lastName,
    required this.email,
   required this.password,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'confirmPassword': password,
    };
  }

  @override
  String toString() {
    return 'SignUpParams(firstName: $firstName, lastName: $lastName, email: $email, password: $password)';
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
      ];
}

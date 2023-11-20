import 'package:akukom/cores/base_request_body/base_request_body.dart';

class LoginParams extends RequestParam {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];

  @override
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() => 'LoginParams(email: $email, password: $password)';
}

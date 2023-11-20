import 'package:akukom/cores/base_request_body/base_request_body.dart';

class ChangePasswordParam extends RequestParam {
  final String email;
  final String password;
  final String confirmNewPassword;

  ChangePasswordParam({
    required this.email,
    required this.password,
    required this.confirmNewPassword,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'newPassword': password,
      'confirmNewPassword': confirmNewPassword,
    };
  }

  @override
  List<Object> get props => [
        email,
        password,
        confirmNewPassword,
      ];

  @override
  String toString() =>
      'ChangePasswordParam(email: $email, password: $password, confirmNewPassword: $confirmNewPassword)';
}

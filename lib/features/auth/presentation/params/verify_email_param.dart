import 'package:akukom/cores/base_request_body/base_request_body.dart';

class VerifyEmailParam extends RequestParam {
  final String email;
  final String code;

  VerifyEmailParam({
    required this.email,
    required this.code,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'code': code,
    };
  }

  @override
  List<Object> get props => [
        email,
        code,
      ];

  @override
  String toString() => 'VerifyEmailParam(email: $email, code: $code)';
}

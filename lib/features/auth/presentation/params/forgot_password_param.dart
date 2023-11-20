import 'package:akukom/cores/base_request_body/base_request_body.dart';

class ForgotPasswordParams extends RequestParam {
  final String email;

  ForgotPasswordParams({
    required this.email,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }

  @override
  List<Object> get props => [
        email,
      ];
}

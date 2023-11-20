import 'package:akukom/cores/base_request_body/base_request_body.dart';

class VerifyPhoneOtpParams extends RequestParam {
  final String code;

  VerifyPhoneOtpParams({
    required this.code,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'code': code,
    };
  }

  @override
  List<Object> get props => [
        code,
      ];
}

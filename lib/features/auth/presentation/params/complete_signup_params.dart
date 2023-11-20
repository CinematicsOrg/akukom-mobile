import 'package:akukom/cores/base_request_body/base_request_body.dart';

class CompleteSignupParams extends RequestParam {
  final String phoneNumber;
  final String country;

  CompleteSignupParams({
    required this.phoneNumber,
    required this.country,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': "+$phoneNumber",
      'country': country,
    };
  }

  @override
  String toString() =>
      'CompleteSignupParams(phoneNumber: $phoneNumber, country: $country)';

  @override
  List<Object?> get props => [
        phoneNumber,
        country,
      ];
}

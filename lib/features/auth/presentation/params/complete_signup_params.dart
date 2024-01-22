import 'package:akukom/cores/base_request_body/base_request_body.dart';

class CompleteSignupParams extends RequestParam {
  final String phoneNumber;
  final String country;
  final String tribe;

  CompleteSignupParams({
    required this.phoneNumber,
    required this.country,
    required this.tribe,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'phone': phoneNumber,
      'country': country,
      'tribe': tribe,
    };
  }

  @override
  String toString() =>
      'CompleteSignupParams(phoneNumber: $phoneNumber, country: $country, tribe: $tribe)';

  @override
  List<Object?> get props => [
        phoneNumber,
        country,
        tribe,
      ];
}

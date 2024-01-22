
import 'package:akukom/features/auth/__auth.dart';

class SignupCompleteModel extends SignupCompleteEntity {
  const SignupCompleteModel({
    required int? statusCode,
    required String? message,
    required User? data,
  }) : super(
          statusCode: statusCode,
          message: message,
          data: data,
        );

  factory SignupCompleteModel.fromJson(Map<String, dynamic> json) =>
      SignupCompleteModel(
        statusCode: json["statusCode"],
        message: json["message"],
        data: User?.fromJson(json["data"]),
      );
}

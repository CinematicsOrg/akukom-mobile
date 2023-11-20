import 'dart:convert';

import 'package:akukom/features/auth/__auth.dart';

SignupCompleteModel signupCompleteModelFromJson(String str) =>
    SignupCompleteModel.fromJson(json.decode(str));

String signupCompleteModelToJson(SignupCompleteModel data) =>
    json.encode(data.toJson());

class SignupCompleteModel extends SignupCompleteEntity {
  final int? statusCode;
  final String? message;
  final User? data;

  const SignupCompleteModel({
    required this.statusCode,
    required this.message,
    required this.data,
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

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data": data?.toJson(),
      };
}

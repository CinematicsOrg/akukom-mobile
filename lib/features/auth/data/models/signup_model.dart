import 'dart:convert';

import 'package:akukom/features/auth/__auth.dart';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel extends SignupEntity {
  final int? statusCode;
  final String? message;
  final SignupData? data;

  const SignupModel({
    required this.statusCode,
    required this.message,
    required this.data,
  }) : super(
          statusCode: statusCode,
          message: message,
          data: data,
        );

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        statusCode: json["statusCode"],
        message: json["message"],
        data: SignupData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data": data?.toJson(),
      };
}

class SignupData extends SignupDataEntity {
  final User? user;
  final String? accessToken;
  final String? refreshToken;

  const SignupData({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  }) : super(
          user: user,
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

  factory SignupData.fromJson(Map<String, dynamic> json) => SignupData(
        user: User.fromJson(json["user"]),
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

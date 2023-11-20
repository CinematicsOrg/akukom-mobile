import 'dart:convert';

import 'package:akukom/features/auth/__auth.dart';

BaseAuthModel baseAuthModelFromJson(String str) =>
    BaseAuthModel.fromJson(json.decode(str));

String baseAuthModelToJson(BaseAuthModel data) => json.encode(data.toJson());

class BaseAuthModel extends BaseAuthEntity {
  final int? statusCode;
  final String? message;
  final User? data;

  const BaseAuthModel({
    required this.statusCode,
    required this.message,
    required this.data,
  }) : super(
          statusCode: statusCode,
          message: message,
          data: data,
        );

  factory BaseAuthModel.fromJson(Map<String, dynamic> json) => BaseAuthModel(
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

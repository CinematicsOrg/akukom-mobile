import 'package:akukom/features/auth/__auth.dart';

class SignupModel extends SignupEntity {
  const SignupModel({
    required int? statusCode,
    required String? message,
    required SignupData? data,
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
}

class SignupData extends SignupDataEntity {
  const SignupData({
    required User? user,
    required String? accessToken,
    required String? refreshToken,
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
}

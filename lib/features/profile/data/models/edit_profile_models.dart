import 'package:akukom/features/auth/__auth.dart';
import 'package:akukom/features/profile/__profile.dart';

class EditProfileModel extends EditProfileEntity {
  const EditProfileModel({
    required String? message,
    required bool success,
    required int statusCode,
    required User data,
  }) : super(
          user: data,
        );

  factory EditProfileModel.fromJson(Map<String, dynamic> json) =>
      EditProfileModel(
        message: json["message"],
        success: json["success"],
        statusCode: json["statusCode"],
        data: User.fromJson(json["data"]),
      );
}

import 'package:akukom/features/auth/__auth.dart';

class BaseAuthModel extends BaseAuthEntity {
  const BaseAuthModel({
    required int? statusCode,
    required String? message,
    required User? data,
  }) : super(
          statusCode: statusCode,
          message: message,
          data: data,
        );

  @override
  List<Object?> get props => [
        statusCode,
        message,
        data,
      ];

  @override
  String toString() =>
      'BaseAuthModel(statusCode: $statusCode, message: $message, data: $data)';

  factory BaseAuthModel.fromJson(Map<String, dynamic> json) => BaseAuthModel(
        statusCode: json["statusCode"] as int?,
        message: json["message"] as String?,
        data: User?.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        // "data": data?.toJson(),
      };
}

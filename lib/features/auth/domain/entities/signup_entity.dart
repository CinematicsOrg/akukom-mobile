// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:akukom/features/auth/__auth.dart';

class SignupEntity extends Equatable {
  final int? statusCode;
  final String? message;
  final SignupDataEntity? data;

  const SignupEntity({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [
        statusCode,
        message,
        data,
      ];

  @override
  String toString() =>
      'SignupEntity(statusCode: $statusCode, message: $message, data: $data)';
}

class SignupDataEntity extends Equatable {
  final User? user;
  final String? accessToken;
  final String? refreshToken;

  const SignupDataEntity({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [
        user,
        accessToken,
        refreshToken,
      ];

  @override
  String toString() =>
      'SignupDataEntity(user: $user, accessToken: $accessToken, refreshToken: $refreshToken)';
}

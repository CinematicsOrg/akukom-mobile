// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:akukom/features/auth/__auth.dart';

class SignupCompleteEntity extends Equatable {
  final int? statusCode;
  final String? message;
  final UserEntity? data;

  const SignupCompleteEntity({
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
      'SignupCompleteEntity(statusCode: $statusCode, message: $message, data: $data)';
}

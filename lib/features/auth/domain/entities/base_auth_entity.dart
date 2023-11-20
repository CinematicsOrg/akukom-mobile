// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:akukom/features/auth/__auth.dart';

class BaseAuthEntity extends Equatable {
  final int? statusCode;
  final String? message;
  final UserEntity? data;

  const BaseAuthEntity({
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
      'BaseAuthEntity(statusCode: $statusCode, message: $message, data: $data)';
}

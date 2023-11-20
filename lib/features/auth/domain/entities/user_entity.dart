// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final bool? hasVerifiedPhone;
  final String? password;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? id;

  const UserEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.hasVerifiedPhone,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      email,
      hasVerifiedPhone,
      password,
      createdAt,
      updatedAt,
      id,
    ];
  }

  @override
  String toString() {
    return 'UserEntity(firstName: $firstName, lastName: $lastName, email: $email, hasVerifiedPhone: $hasVerifiedPhone, password: $password, createdAt: $createdAt, updatedAt: $updatedAt, id: $id)';
  }
}

import 'package:akukom/features/auth/__auth.dart';

class User extends UserEntity {
  final String? firstName;
  final String? lastName;
  final String? email;
  final bool? hasVerifiedPhone;
  final String? password;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? id;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.hasVerifiedPhone,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          email: email,
          hasVerifiedPhone: hasVerifiedPhone,
          password: password,
          createdAt: createdAt,
          updatedAt: updatedAt,
          id: id,
        );

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        hasVerifiedPhone: json["hasVerifiedPhone"],
        password: json["password"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "hasVerifiedPhone": hasVerifiedPhone,
        "password": password,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": id,
      };
}

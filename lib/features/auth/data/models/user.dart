import 'package:akukom/features/auth/__auth.dart';

class User extends UserEntity {
  const User({
    required String? firstName,
    required String? lastName,
    required String? email,
    required bool? hasVerifiedPhone,
    required String? password,
    required DateTime? createdAt,
    required DateTime? updatedAt,
    required String? id,
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
}

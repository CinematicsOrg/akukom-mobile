import 'package:akukom/features/auth/__auth.dart';

class User extends UserEntity {
  const User({
    required String? firstName,
    required String? lastName,
    required String? email,
    required bool? hasVerifiedPhone,
    required String? password,
    required String? country,
    required String? image,
    required String? tribe,
    required String? phone,
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
          country: country,
          tribe: tribe,
          phone: phone,
          image: image,
        );

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        hasVerifiedPhone: json["hasVerifiedPhone"],
        password: json["password"],
        phone: json["phone"],
        country: json["country"],
        image: json["image"],
        tribe: json["tribe"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "hasVerifiedPhone": hasVerifiedPhone,
        "password": password,
        "phone": phone,
        "country": country,
        "tribe": tribe,
        "image": image,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "id": id,
      };
}

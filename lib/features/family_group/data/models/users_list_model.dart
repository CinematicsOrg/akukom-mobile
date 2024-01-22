// To parse this JSON data, do
//
//     final usersListModel = usersListModelFromJson(jsonString);

import 'dart:convert';

import 'package:akukom/features/family_group/__family_group.dart';

UsersListModel usersListModelFromJson(String str) =>
    UsersListModel.fromJson(json.decode(str));

class UsersListModel extends UserListEntity {
  const UsersListModel({
    required String? message,
    required bool? success,
    required int? statusCode,
    required UsersListData? data,
  }) : super(
          data: data,
        );

  factory UsersListModel.fromJson(Map<String, dynamic> json) => UsersListModel(
        message: json["message"],
        success: json["success"],
        statusCode: json["statusCode"],
        data:
            json["data"] == null ? null : UsersListData.fromJson(json["data"]),
      );
}

class UsersListData extends UserListDataEntity {
  const UsersListData({
    required List<UsersListDoc> docs,
    required int? totalDocs,
    required int? offset,
    required int? limit,
    required int? totalPages,
    required int? page,
    required int? pagingCounter,
    required bool? hasPrevPage,
    required bool? hasNextPage,
    final bool? prevPage,
    required int? nextPage,
  }) : super(
          docs: docs,
          totalDocs: totalDocs,
          offset: offset,
          limit: limit,
          totalPages: totalPages,
          page: page,
          pagingCounter: pagingCounter,
          hasPrevPage: hasPrevPage,
          hasNextPage: hasNextPage,
          prevPage: prevPage,
          nextPage: nextPage,
        );

  factory UsersListData.fromJson(Map<String, dynamic> json) => UsersListData(
        docs: json["docs"] == null
            ? []
            : List<UsersListDoc>.from(
                json["docs"]!.map((x) => UsersListDoc.fromJson(x))),
        totalDocs: json["totalDocs"],
        offset: json["offset"],
        limit: json["limit"],
        totalPages: json["totalPages"],
        page: json["page"],
        pagingCounter: json["pagingCounter"],
        hasPrevPage: json["hasPrevPage"],
        hasNextPage: json["hasNextPage"],
        prevPage: json["prevPage"],
        nextPage: json["nextPage"],
      );
}

class UsersListDoc extends UsersListDocEntity {
  const UsersListDoc({
    required bool? hasVerifiedEmail,
    required String? status,
    required List<dynamic>? family,
    required String? firstName,
    required String? lastName,
    required String? email,
    required bool? hasVerifiedPhone,
    required String? password,
    required DateTime? createdAt,
    required DateTime? updatedAt,
    required String? id,
    required String? country,
    required String? phone,
  }) : super(
          hasVerifiedEmail: hasVerifiedEmail,
          status: status,
          family: family,
          firstName: firstName,
          lastName: lastName,
          email: email,
          hasVerifiedPhone: hasVerifiedPhone,
          password: password,
          createdAt: createdAt,
          updatedAt: updatedAt,
          id: id,
          country: country,
          phone: phone,
        );

  factory UsersListDoc.fromJson(Map<String, dynamic> json) => UsersListDoc(
        hasVerifiedEmail: json["hasVerifiedEmail"],
        status: json["status"],
        family: json["family"] == null
            ? []
            : List<dynamic>.from(json["family"]!.map((x) => x)),
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        hasVerifiedPhone: json["hasVerifiedPhone"],
        password: json["password"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        id: json["id"],
        country: json["country"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "hasVerifiedEmail": hasVerifiedEmail,
        "status": status,
        "family":
            family == null ? [] : List<dynamic>.from(family!.map((x) => x)),
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "hasVerifiedPhone": hasVerifiedPhone,
        "password": password,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": id,
        "country": country,
        "phone": phone,
      };
}

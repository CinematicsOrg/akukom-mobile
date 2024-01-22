// To parse this JSON data, do
//
//     final createFamilyModel = createFamilyModelFromJson(jsonString);

import 'dart:convert';

import 'package:akukom/features/family_group/__family_group.dart';

CreateFamilyModel createFamilyModelFromJson(String str) =>
    CreateFamilyModel.fromJson(json.decode(str));

class CreateFamilyModel extends CreateFamilyEntity {
  const CreateFamilyModel({
    required String? message,
    required bool? success,
    required int? statusCode,
    required FamilyData? data,
  }) : super(data: data);

  factory CreateFamilyModel.fromJson(Map<String, dynamic> json) =>
      CreateFamilyModel(
        message: json["message"],
        success: json["success"],
        statusCode: json["statusCode"],
        data: json["data"] == null ? null : FamilyData.fromJson(json["data"]),
      );
}

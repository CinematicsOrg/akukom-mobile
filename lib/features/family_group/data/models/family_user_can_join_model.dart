// To parse this JSON data, do
//
//     final familyUserCanJoinModel = familyUserCanJoinModelFromJson(jsonString);

import 'package:akukom/features/family_group/__family_group.dart';

class FamilyUserCanJoinModel extends FamilyUserCanJoinEntity {
  const FamilyUserCanJoinModel({
    required String? message,
    required bool? success,
    required int? statusCode,
    required FamilyUserCanJoinData? data,
  }) : super(
          data: data,
        );

  factory FamilyUserCanJoinModel.fromJson(Map<String, dynamic> json) =>
      FamilyUserCanJoinModel(
        message: json["message"],
        success: json["success"],
        statusCode: json["statusCode"],
        data: json["data"] == null
            ? null
            : FamilyUserCanJoinData.fromJson(json["data"]),
      );
}

class FamilyUserCanJoinData extends FamilyUserCanJoinDataEntity {
  const FamilyUserCanJoinData({
    required List<FamilyData>? docs,
    required int? totalDocs,
    required int? offset,
    required int? limit,
    required int? totalPages,
    required int? page,
    required int? pagingCounter,
    required bool? hasPrevPage,
    required bool? hasNextPage,
    required bool? prevPage,
    required bool? nextPage,
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

  factory FamilyUserCanJoinData.fromJson(Map<String, dynamic> json) =>
      FamilyUserCanJoinData(
        docs: json["docs"] == null
            ? []
            : List<FamilyData>.from(
                json["docs"]!.map((x) => FamilyData.fromJson(x))),
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

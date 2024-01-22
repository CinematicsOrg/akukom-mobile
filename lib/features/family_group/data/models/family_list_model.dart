// To parse this JSON data, do
//
//     final familyUserCanJoinModel = familyUserCanJoinModelFromJson(jsonString);

import 'package:akukom/features/family_group/__family_group.dart';

class UserFamilyListModel extends UserFamilyListEntity {
  const UserFamilyListModel({
    required String? message,
    required bool? success,
    required int? statusCode,
    required UserFamilyListData? data,
  }) : super(
          data: data,
        );

  factory UserFamilyListModel.fromJson(Map<String, dynamic> json) =>
      UserFamilyListModel(
        message: json["message"],
        success: json["success"],
        statusCode: json["statusCode"],
        data: json["data"] == null
            ? null
            : UserFamilyListData.fromJson(json["data"]),
      );
}

class UserFamilyListData extends UserFamilyListDataEntity {
  const UserFamilyListData({
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

  factory UserFamilyListData.fromJson(Map<String, dynamic> json) =>
      UserFamilyListData(
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

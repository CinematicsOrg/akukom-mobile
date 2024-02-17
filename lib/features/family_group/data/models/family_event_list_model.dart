import 'dart:convert';

import 'package:akukom/features/family_group/__family_group.dart';

FamilyEventListModel familyEventListModelFromJson(String str) =>
    FamilyEventListModel.fromJson(json.decode(str));

class FamilyEventListModel extends FamilyEventListEntity {
  const FamilyEventListModel({
    required String? message,
    required bool? success,
    required int? statusCode,
    required EventListData? data,
  }) : super(
          message: message,
          success: success,
          statusCode: statusCode,
          data: data,
        );

  factory FamilyEventListModel.fromJson(Map<String, dynamic> json) =>
      FamilyEventListModel(
        message: json["message"],
        success: json["success"],
        statusCode: json["statusCode"],
        data:
            json["data"] == null ? null : EventListData.fromJson(json["data"]),
      );
}

class EventListData extends EventListDataEntity {
  const EventListData({
    required List<EventsModel>? docs,
    required int? totalDocs,
    required int? offset,
    required int? limit,
    required int? totalPages,
    required int? page,
    required int? pagingCounter,
    required bool? hasPrevPage,
    required bool? hasNextPage,
    required dynamic prevPage,
    required dynamic nextPage,
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

  factory EventListData.fromJson(Map<String, dynamic> json) => EventListData(
        docs: json["docs"] == null
            ? []
            : List<EventsModel>.from(
                json["docs"]!.map((x) => EventsModel.fromJson(x))),
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

class EventsModel extends EventsEntity {
  const EventsModel({
    required String? name,
    required String? coverImageUrl,
    required String? coverImageKey,
    required String? creator,
    required DateTime? startDate,
    required DateTime? stopDate,
    required List<dynamic> guests,
    required String? family,
    required DateTime? createdAt,
    required DateTime? updatedAt,
    required String? id,
    required String? location,
  }) : super(
          name: name,
          coverImageUrl: coverImageUrl,
          coverImageKey: coverImageKey,
          creator: creator,
          startDate: startDate,
          stopDate: stopDate,
          guests: guests,
          family: family,
          createdAt: createdAt,
          updatedAt: updatedAt,
          id: id,
          location: location,
        );

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        name: json["name"],
        coverImageUrl: json["coverImageUrl"],
        coverImageKey: json["coverImageKey"],
        creator: json["creator"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        stopDate:
            json["stopDate"] == null ? null : DateTime.parse(json["stopDate"]),
        guests: json["guests"] == null
            ? []
            : List<dynamic>.from(json["guests"]!.map((x) => x)),
        family: json["family"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        id: json["id"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "coverImageUrl": coverImageUrl,
        "coverImageKey": coverImageKey,
        "creator": creator,
        "startDate": startDate?.toIso8601String(),
        "stopDate": stopDate?.toIso8601String(),
        "guests":
            guests == null ? [] : List<dynamic>.from(guests!.map((x) => x)),
        "family": family,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": id,
        "location": location,
      };
}

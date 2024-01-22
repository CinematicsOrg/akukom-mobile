import 'package:akukom/features/family_group/__family_group.dart';

class FamilyData extends FamilyDataEntity {
  const FamilyData({
    required String? name,
    required String? image,
    required String? imageKey,
    required String? description,
    required String? creator,
    required List<dynamic>? pendingRequests,
    required List<String>? members,
    required DateTime? createdAt,
    required DateTime? updatedAt,
    required String? id,
  }) : super(
          name: name,
          image: image,
          imageKey: imageKey,
          description: description,
          creator: creator,
          pendingRequests: pendingRequests,
          members: members,
          createdAt: createdAt,
          updatedAt: updatedAt,
          id: id,
        );

  factory FamilyData.fromJson(Map<String, dynamic> json) => FamilyData(
        name: json["name"],
        image: json["image"],
        imageKey: json["imageKey"],
        description: json["description"],
        creator: json["creator"],
        pendingRequests: json["pendingRequests"] == null
            ? []
            : List<dynamic>.from(json["pendingRequests"]!.map((x) => x)),
        members: json["members"] == null
            ? []
            : List<String>.from(json["members"]!.map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "imageKey": imageKey,
        "description": description,
        "creator": creator,
        "pendingRequests": pendingRequests == null
            ? []
            : List<dynamic>.from(pendingRequests!.map((x) => x)),
        "members":
            members == null ? [] : List<dynamic>.from(members!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": id,
      };
}

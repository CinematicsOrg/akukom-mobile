import 'package:equatable/equatable.dart';

class FamilyDataEntity extends Equatable {
  final String? name;
  final String? image;
  final String? imageKey;
  final String? description;
  final String? creator;
  final List<dynamic>? pendingRequests;
  final List<String>? members;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? id;

  const FamilyDataEntity({
    this.name,
    this.image,
    this.imageKey,
    this.description,
    this.creator,
    this.pendingRequests,
    this.members,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  @override
  List<Object?> get props => [
        name,
        image,
        imageKey,
        description,
        creator,
        pendingRequests,
        members,
        createdAt,
        updatedAt,
        id,
      ];

  @override
  bool get stringify => true;
}

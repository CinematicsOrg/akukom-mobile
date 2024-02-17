import 'package:equatable/equatable.dart';

class FamilyEventListEntity extends Equatable {
  final String? message;
  final bool? success;
  final int? statusCode;
  final EventListDataEntity? data;

  const FamilyEventListEntity({
    required this.message,
    required this.success,
    required this.statusCode,
    required this.data,
  });

  @override
  List<Object?> get props => [
        message,
        success,
        statusCode,
        data,
      ];

  @override
  bool get stringify => true;
}

class EventListDataEntity extends Equatable {
  final List<EventsEntity>? docs;
  final int? totalDocs;
  final int? offset;
  final int? limit;
  final int? totalPages;
  final int? page;
  final int? pagingCounter;
  final bool? hasPrevPage;
  final bool? hasNextPage;
  final dynamic prevPage;
  final dynamic nextPage;

  const EventListDataEntity({
    required this.docs,
    required this.totalDocs,
    required this.offset,
    required this.limit,
    required this.totalPages,
    required this.page,
    required this.pagingCounter,
    required this.hasPrevPage,
    required this.hasNextPage,
    required this.prevPage,
    required this.nextPage,
  });

  @override
  List<Object?> get props => [
        docs,
        totalDocs,
        offset,
        limit,
        totalPages,
        page,
        pagingCounter,
        hasPrevPage,
        hasNextPage,
        prevPage,
        nextPage,
      ];

  @override
  bool get stringify => true;
}

class EventsEntity extends Equatable {
  final String? name;
  final String? coverImageUrl;
  final String? coverImageKey;
  final String? creator;
  final DateTime? startDate;
  final DateTime? stopDate;
  final List<dynamic>? guests;
  final String? family;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? location;
  final String? id;

  const EventsEntity({
    required this.name,
    required this.coverImageUrl,
    required this.coverImageKey,
    required this.creator,
    required this.startDate,
    required this.stopDate,
    required this.guests,
    required this.family,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.location,
  });

  @override
  List<Object?> get props => [
        name,
        coverImageUrl,
        coverImageKey,
        creator,
        startDate,
        stopDate,
        guests,
        family,
        createdAt,
        updatedAt,
        id,
        location,
      ];

  @override
  bool get stringify => true;
}

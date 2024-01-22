import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';

class FamilyUserCanJoinEntity extends Equatable {
  final FamilyUserCanJoinDataEntity? data;

  const FamilyUserCanJoinEntity({
    required this.data,
  });

  @override
  List<Object?> get props => [
        data,
      ];
}

class FamilyUserCanJoinDataEntity extends Equatable {
  final List<FamilyDataEntity>? docs;
  final int? totalDocs;
  final int? offset;
  final int? limit;
  final int? totalPages;
  final int? page;
  final int? pagingCounter;
  final bool? hasPrevPage;
  final bool? hasNextPage;
  final bool? prevPage;
  final bool? nextPage;

  const FamilyUserCanJoinDataEntity({
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
}

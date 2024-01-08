// import 'package:dartz/dartz.dart';
// import 'package:flutter/foundation.dart';
// import 'package:akukom/core/error/failures.dart';
// import 'package:akukom/core/usecases/usecase.dart';
// import 'package:akukom/features/family_group/domain/entities/family_group_entity.dart';
// import 'package:akukom/features/family_group/domain/repositories/family_group_repository.dart';

// class FetchFamilyGroupUseCase extends UseCase<FamilyGroupEntity, FetchFamilyGroupParam> {
//   final FamilyGroupRepository repository;

//   FetchFamilyGroupUseCase(this.repository);

//   @override
//   Future<Either<Failure, FamilyGroupEntity>> call(FetchFamilyGroupParam params) async {
//     return await repository.fetchFamilyGroup(params: params);
//   }
// }

// class FetchFamilyGroupParam {
//   String id;
//   FetchFamilyGroupParam({@required this.id});
// }

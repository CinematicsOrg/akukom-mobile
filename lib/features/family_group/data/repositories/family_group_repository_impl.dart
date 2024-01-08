// import 'package:dartz/dartz.dart';
// import 'package:flutter/foundation.dart';
// import 'package:akukom/core/error/failures.dart';
// import 'package:akukom/core/error/exceptions.dart';
// import 'package:akukom/features/family_group/data/datasources/family_group_remote_data_source.dart';
// import 'package:akukom/features/family_group/data/responses/family_group_response.dart';
// import 'package:akukom/features/family_group/domain/entities/family_group_entity.dart';
// import 'package:akukom/features/family_group/domain/repositories/family_group_repository.dart';
// import 'package:akukom/features/family_group/domain/usecases/fetch_family_group_usecase.dart';

// class FamilyGroupRepositoryImpl implements FamilyGroupRepository {
//   FamilyGroupRemoteDataSource familyGroupRemoteDataSource;

//   FamilyGroupRepositoryImpl({@required this.familyGroupRemoteDataSource});

//   @override
//   Future<Either<Failure, FamilyGroupEntity>> fetchFamilyGroup({@required FetchFamilyGroupParam params}) async {
//     try {
//       var _response = await familyGroupRemoteDataSource.fetchFamilyGroup(id: params.id);
//       return Right(_mapPDResponseToEntity(response: _response));
//     } on ServerException {
//       return Left(ServerFailure());
//     } catch (e) {
//       return Left(ServerFailure());
//     }
//   }

//   FamilyGroupEntity _mapPDResponseToEntity({@required FamilyGroupResponse response}) {
//     return FamilyGroupEntity(
//       id: response.id,
//       name: response.name,
//     );
//   }
// }

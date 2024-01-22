import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/params.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:fpdart/fpdart.dart';

abstract class FamilyGroupRepository {
  Future<Either<Failures, CreateFamilyEntity>> createFamily(
      CreateFamilyParam param);
  Future<Either<Failures, BaseEntity>> userInFamily(RequestParam param);
  Future<Either<Failures, BaseEntity>> updateFamily(RequestParam param);
  Future<Either<Failures, BaseEntity>> addFamilyMemebers(RequestParam param);
  Future<Either<Failures, BaseEntity>> listPendingFamily(NoParams param);
  Future<Either<Failures, FamilyUserCanJoinEntity>> listFamilyUserCanJoin(
      ListFamilyUserCanJoinParam param);
  Future<Either<Failures, BaseEntity>> getFamilyMembers(NoParams param);
  Future<Either<Failures, BaseEntity>> getFamilyDetails(RequestParam param);
  Future<Either<Failures, BaseEntity>> requestToJoinFamily(RequestParam param);
  Future<Either<Failures, BaseEntity>> acceptOrRejectRequest(
      RequestParam param);

  Future<Either<Failures, BaseEntity>> getUserFamily(NoParams param);

  Future<Either<Failures, UserListEntity>> getUsersList(GetUsersParam param);
}

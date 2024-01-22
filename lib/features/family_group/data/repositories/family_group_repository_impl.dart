import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/try_catch_helper/try_catch_helper.dart';
import 'package:akukom/cores/usecase/params.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:fpdart/fpdart.dart';

class FamilyGroupRepositoryImpl extends FamilyGroupRepository {
  final FamilyGroupRemoteDataSource familyGroupRemoteDataSource;

  FamilyGroupRepositoryImpl({required this.familyGroupRemoteDataSource});

  @override
  Future<Either<Failures, BaseEntity>> acceptOrRejectRequest(
      RequestParam param) {
    final action = familyGroupRemoteDataSource.acceptOrRejectRequest(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, BaseEntity>> addFamilyMemebers(RequestParam param) {
    final action = familyGroupRemoteDataSource.addFamilyMemebers(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, CreateFamilyEntity>> createFamily(CreateFamilyParam param) {
    final action = familyGroupRemoteDataSource.createFamily(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<CreateFamilyModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, BaseEntity>> getFamilyDetails(RequestParam param) {
    final action = familyGroupRemoteDataSource.getFamilyDetails(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, BaseEntity>> getFamilyMembers(NoParams param) {
    final action = familyGroupRemoteDataSource.getFamilyMembers(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, UserFamilyListEntity>> getUserFamily(NoParams param) {
    final action = familyGroupRemoteDataSource.getUserFamily(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<UserFamilyListModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, FamilyUserCanJoinEntity>> listFamilyUserCanJoin(ListFamilyUserCanJoinParam param) {
    final action = familyGroupRemoteDataSource.listFamilyUserCanJoin(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<FamilyUserCanJoinModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, BaseEntity>> listPendingFamily(NoParams param) {
    final action = familyGroupRemoteDataSource.listPendingFamily(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, BaseEntity>> requestToJoinFamily(RequestParam param) {
    final action = familyGroupRemoteDataSource.requestToJoinFamily(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, BaseEntity>> updateFamily(RequestParam param) {
    final action = familyGroupRemoteDataSource.updateFamily(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, BaseEntity>> userInFamily(RequestParam param) {
    final action = familyGroupRemoteDataSource.userInFamily(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, UserListEntity>> getUsersList(GetUsersParam param) {
    final action = familyGroupRemoteDataSource.getUsers(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<UsersListModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }
}

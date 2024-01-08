import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/try_catch_helper/try_catch_helper.dart';
import 'package:akukom/cores/usecase/params.dart';
import 'package:akukom/features/auth/data/__data.dart';
import 'package:akukom/features/auth/domain/__domain.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:fpdart/fpdart.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, BaseEntity>> changePassword(RequestParam param) {
    final action = remoteDataSource.changePassword(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, BaseEntity>> deactivateAccount(NoParams param) {
    final action = remoteDataSource.deactivateAccount(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, EditProfileEntity>> editUserProfile(
      RequestParam param) {
    final action = remoteDataSource.editUserProfile(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<EditProfileModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, BaseEntity>> deleteAccount(NoParams param) {
    final action = remoteDataSource.deleteAccount(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, EditProfileEntity>> uploadProfilePicture(RequestParam param) {
    final action = remoteDataSource.uploadProfilePicture(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<EditProfileModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }
}

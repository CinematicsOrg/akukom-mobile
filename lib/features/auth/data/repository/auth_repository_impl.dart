import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/try_catch_helper/try_catch_helper.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, BaseEntity>> changePassword(RequestParam param) {
    final action = remoteDataSource.changePassword(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, BaseEntity>> checkPhoneUsage(RequestParam param) {
    final action = remoteDataSource.checkPhoneUsage(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, BaseAuthEntity>> completeSignup(
      RequestParam param) async {
    final action = remoteDataSource.completeSignup(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseAuthModel>();
    return await repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, BaseEntity>> forgotPasswordOtp(RequestParam param) {
    final action = remoteDataSource.forgotPasswordOtp(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, BaseEntity>> forgotPasswordVerificationOtp(
      RequestParam param) {
    final action = remoteDataSource.forgotPasswordVerificationOtp(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, SignupEntity>> login(RequestParam param) async {
    final action = remoteDataSource.login(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<SignupModel>();
    return await repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, BaseEntity>> refreshToken(RequestParam param) {
    final action = remoteDataSource.refreshToken(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseModel>();
    return repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, SignupEntity>> signup(RequestParam param) async {
    final action = remoteDataSource.signup(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<SignupModel>();
    return await repoTryCatchHelper.tryAction(() => action);
  }

  @override
  Future<Either<Failures, BaseAuthEntity>> verifyPhoneNumber(
      RequestParam param) async {
    final action = remoteDataSource.verifyPhoneNumber(
      param,
    );

    final repoTryCatchHelper = RepoTryCatchHelper<BaseAuthModel>();
    return await repoTryCatchHelper.tryAction(() => action);
  }
}

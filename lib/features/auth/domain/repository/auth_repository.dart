import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<Failures, SignupEntity>> signup(RequestParam param);

  Future<Either<Failures, BaseAuthEntity>> completeSignup(RequestParam param);

  Future<Either<Failures, SignupEntity>> login(RequestParam param);

  Future<Either<Failures, BaseEntity>> checkPhoneUsage(RequestParam param);

  Future<Either<Failures, BaseAuthEntity>> verifyPhoneNumber(
      RequestParam param);

  Future<Either<Failures, BaseEntity>> forgotPasswordOtp(RequestParam param);

  Future<Either<Failures, BaseEntity>> forgotPasswordVerificationOtp(
      RequestParam param);

  Future<Either<Failures, BaseEntity>> changePassword(RequestParam param);

  Future<Either<Failures, BaseEntity>> refreshToken(RequestParam param);
}

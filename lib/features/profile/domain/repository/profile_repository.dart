import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProfileRepository {
  Future<Either<Failures, EditProfileEntity>> editUserProfile(
      RequestParam param);

  Future<Either<Failures, BaseEntity>> changePassword(RequestParam param);

  Future<Either<Failures, BaseEntity>> deleteAccount(NoParams param);

  Future<Either<Failures, BaseEntity>> deactivateAccount(NoParams param);

  Future<Either<Failures, EditProfileEntity>> uploadProfilePicture(
      RequestParam param);
}

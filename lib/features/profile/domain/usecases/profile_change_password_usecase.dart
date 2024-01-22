import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase_interface.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:fpdart/fpdart.dart';

class ProfileChangePasswordUseCase
    implements UseCaseFuture<Failures, BaseEntity, RequestParam> {
  final ProfileRepository repository;

  const ProfileChangePasswordUseCase({required this.repository});

  @override
  Future<Either<Failures, BaseEntity>> call(
    RequestParam params,
  ) async {
    return await repository.changePassword(params);
  }
}

class ProfileChangePasswordParam extends RequestParam {
  final String currentPassword;
  final String newPassword;

  ProfileChangePasswordParam({
    required this.currentPassword,
    required this.newPassword,
  });

  @override
  List<Object?> get props => [currentPassword, newPassword];

  @override
  Map<String, dynamic> toMap() {
    return {
      'currentPassword': currentPassword,
      'newPassword': newPassword,
    };
  }

  @override
  String toString() =>
      'ProfileChangePasswordParam(currentPassword: $currentPassword, newPassword: $newPassword)';
}

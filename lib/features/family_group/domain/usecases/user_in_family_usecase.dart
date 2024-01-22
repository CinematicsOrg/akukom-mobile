// Use Case for UserInFamily
import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase_interface.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:fpdart/fpdart.dart';

class UserInFamilyUseCase implements UseCaseFuture<Failures, BaseEntity, RequestParam> {
  final FamilyGroupRepository familyGroupRepository;

  const UserInFamilyUseCase({required this.familyGroupRepository});

  @override
  Future<Either<Failures, BaseEntity>> call(RequestParam params) async {
    return await familyGroupRepository.userInFamily(params);
  }
}

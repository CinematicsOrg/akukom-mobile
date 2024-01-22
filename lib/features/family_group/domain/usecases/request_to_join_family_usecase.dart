import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:fpdart/fpdart.dart';

// Use Case for RequestToJoinFamily
class RequestToJoinFamilyUseCase
    implements UseCaseFuture<Failures, BaseEntity, RequestParam> {
  final FamilyGroupRepository familyGroupRepository;

  const RequestToJoinFamilyUseCase({required this.familyGroupRepository});

  @override
  Future<Either<Failures, BaseEntity>> call(RequestParam params) async {
    return await familyGroupRepository.requestToJoinFamily(params);
  }
}

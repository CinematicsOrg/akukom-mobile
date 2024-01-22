import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:fpdart/fpdart.dart';

class AddFamilyMembersUseCase
    implements UseCaseFuture<Failures, BaseEntity, RequestParam> {
  final FamilyGroupRepository familyGroupRepository;

  const AddFamilyMembersUseCase({required this.familyGroupRepository});

  @override
  Future<Either<Failures, BaseEntity>> call(RequestParam params) async {
    return await familyGroupRepository.addFamilyMemebers(params);
  }
}

class AddFamilyMembersParam extends RequestParam {
  final List<String> usersToAdd;
  final String familyId;

  AddFamilyMembersParam({
    required this.usersToAdd,
    required this.familyId,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'usersToAdd': usersToAdd,
      'familyId': familyId,
    };
  }

  @override
  List<Object?> get props => [
        familyId,
        usersToAdd,
      ];
}

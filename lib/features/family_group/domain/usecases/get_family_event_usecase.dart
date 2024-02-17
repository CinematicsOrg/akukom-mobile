import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:fpdart/fpdart.dart';

class GetFamilyEventsUseCase
    implements UseCaseFuture<Failures, FamilyEventListEntity, NoParams> {
  final FamilyGroupRepository familyGroupRepository;

  const GetFamilyEventsUseCase({required this.familyGroupRepository});

  @override
  Future<Either<Failures, FamilyEventListEntity>> call(
    NoParams params,
  ) async {
    return await familyGroupRepository.getFamilyEvents(params);
  }
}

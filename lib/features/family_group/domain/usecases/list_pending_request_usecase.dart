
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:fpdart/fpdart.dart';

class ListPendingFamilyUseCase implements UseCaseFuture<Failures, BaseEntity, NoParams> {
  final FamilyGroupRepository familyGroupRepository;

  const ListPendingFamilyUseCase({required this.familyGroupRepository});

  @override
  Future<Either<Failures, BaseEntity>> call(NoParams params) async {
    return await familyGroupRepository.listPendingFamily(params);
  }
}

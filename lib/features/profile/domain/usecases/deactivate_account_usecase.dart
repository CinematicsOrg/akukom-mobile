import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:fpdart/fpdart.dart';

class DeactivateAccountUseCase
    implements UseCaseFuture<Failures, BaseEntity, NoParams> {
  final ProfileRepository repository;

  const DeactivateAccountUseCase({required this.repository});

  @override
  Future<Either<Failures, BaseEntity>> call(
    NoParams params,
  ) async {
    return await repository.deactivateAccount(params);
  }
}

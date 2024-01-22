import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:fpdart/fpdart.dart';

class ChangePasswordUseCase
    implements UseCaseFuture<Failures, BaseEntity, RequestParam> {
  final AuthRepository repository;

  const ChangePasswordUseCase({required this.repository});

  @override
  Future<Either<Failures, BaseEntity>> call(
    RequestParam params,
  ) async {
    return await repository.changePassword(params);
  }
}


import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:fpdart/fpdart.dart';

class VerifyPhoneNumberUseCase
    implements UseCaseFuture<Failures, BaseAuthEntity, RequestParam> {
  final AuthRepository repository;

  const VerifyPhoneNumberUseCase({required this.repository});

  @override
  Future<Either<Failures, BaseAuthEntity>> call(
    RequestParam params,
  ) async {
    return await repository.verifyPhoneNumber(params);
  }
}

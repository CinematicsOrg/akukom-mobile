import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:fpdart/fpdart.dart';

class SignupUseCase
    implements UseCaseFuture<Failures, SignupEntity, RequestParam> {
  final AuthRepository repository;

  const SignupUseCase({required this.repository});

  @override
  Future<Either<Failures, SignupEntity>> call(
    RequestParam params,
  ) async {
    return await repository.signup(params);
  }
}

import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:fpdart/fpdart.dart';

class EditProfileUseCase
    implements UseCaseFuture<Failures, EditProfileEntity, RequestParam> {
  final ProfileRepository repository;

  const EditProfileUseCase({required this.repository});

  @override
  Future<Either<Failures, EditProfileEntity>> call(
    RequestParam params,
  ) async {
    return await repository.editUserProfile(params);
  }
}

class EditProfileParams extends RequestParam {
  final String? email;
  final String? country;
  final String? phone;

  EditProfileParams({
    this.email,
    this.country,
    this.phone,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'country': country,
    };
  }

  @override
  List<Object?> get props => [
        email,
        country,
        phone,
      ];

  @override
  bool? get stringify => true;
}

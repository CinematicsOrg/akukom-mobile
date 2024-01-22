import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:fpdart/fpdart.dart';

// Use Case for GetUserFamily
class GetUserFamilyUseCase
    implements UseCaseFuture<Failures, UserFamilyListEntity, NoParams> {
  final FamilyGroupRepository familyGroupRepository;

  const GetUserFamilyUseCase({required this.familyGroupRepository});

  @override
  Future<Either<Failures, UserFamilyListEntity>> call(NoParams params) async {
    return await familyGroupRepository.getUserFamily(params);
  }
}

class GetUserFamilyParam extends RequestParam {
  final String search;

  GetUserFamilyParam({ this.search = ''});

  @override
  List<Object?> get props => [search];

  @override
  Map<String, dynamic> toMap() {
    return {
      'search': search,
    };
  }

  String queryParam() {
    return '?search=$search';
  }

  @override
  String toString() => 'GetUserFamilyParam(search: $search)';
}

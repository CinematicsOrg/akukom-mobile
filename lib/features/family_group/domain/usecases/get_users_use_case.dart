import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:fpdart/fpdart.dart';

// Use Case for GetUserFamily
class GetUsersUseCase
    implements UseCaseFuture<Failures, UserListEntity, GetUsersParam> {
  final FamilyGroupRepository familyGroupRepository;

  const GetUsersUseCase({required this.familyGroupRepository});

  @override
  Future<Either<Failures, UserListEntity>> call(GetUsersParam params) async {
    return await familyGroupRepository.getUsersList(params);
  }
}

class GetUsersParam extends RequestParam {
  final String search;
  final bool refresh;

  GetUsersParam({
    this.search = 'a',
    this.refresh = false,
  });

  String get searchParam => '?search=$search';

  @override
  Map<String, dynamic> toMap() {
    return {
      "search": search,
    };
  }

  @override
  List<Object?> get props => [
        search,
        refresh,
      ];
}

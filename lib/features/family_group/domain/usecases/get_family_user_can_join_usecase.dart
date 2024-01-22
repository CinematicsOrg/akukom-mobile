import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:fpdart/fpdart.dart';

// Use Case for ListFamilyUserCanJoin
class ListFamilyUserCanJoinUseCase
    implements UseCaseFuture<Failures, FamilyUserCanJoinEntity, ListFamilyUserCanJoinParam> {
  final FamilyGroupRepository familyGroupRepository;

  const ListFamilyUserCanJoinUseCase({required this.familyGroupRepository});

  @override
  Future<Either<Failures, FamilyUserCanJoinEntity>> call(
      ListFamilyUserCanJoinParam params) async {
    return await familyGroupRepository.listFamilyUserCanJoin(params);
  }
}

class ListFamilyUserCanJoinParam extends RequestParam {
  final String search;

  ListFamilyUserCanJoinParam({this.search = 'a'});

  @override
  Map<String, dynamic> toMap() {
    return {
      'search': search,
    };
  }

  @override
  List<Object?> get props => [
        search,
      ];
}

import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/cores/utils/http_helper.dart';
import 'package:akukom/features/family_group/__family_group.dart';

abstract class FamilyGroupRemoteDataSource {
  Future<CreateFamilyModel> createFamily(CreateFamilyParam param);
  Future<BaseModel> userInFamily(RequestParam param);
  Future<BaseModel> updateFamily(RequestParam param);
  Future<BaseModel> addFamilyMemebers(RequestParam param);
  Future<BaseModel> listPendingFamily(NoParams param);
  Future<FamilyUserCanJoinModel> listFamilyUserCanJoin(ListFamilyUserCanJoinParam param);
  Future<BaseModel> getFamilyMembers(NoParams param);
  Future<BaseModel> getFamilyDetails(RequestParam param);
  Future<BaseModel> requestToJoinFamily(RequestParam param);
  Future<BaseModel> acceptOrRejectRequest(RequestParam param);
  Future<BaseModel> getUserFamily(NoParams param);
  Future<UsersListModel> getUsers(GetUsersParam param);
}

class FamilyGroupRemoteDataSourceImpl implements FamilyGroupRemoteDataSource {
  final HttpHelper httpHelper;

  FamilyGroupRemoteDataSourceImpl({required this.httpHelper});

  @override
  Future<CreateFamilyModel> createFamily(CreateFamilyParam param) async {
    final Map<String, dynamic> response =
        await httpHelper.postMultipartWithFields(
      url: ApiEndpoints.createFamilyGroup,
      files: [await param.toFileMapEntry()],
      fields: await param.toFieldsMap(),
    );

    return CreateFamilyModel.fromJson(response);
  }

  @override
  Future<BaseModel> userInFamily(RequestParam param) async {
    final Map<String, dynamic> response = await httpHelper.get(
      ApiEndpoints.userInFamily,
    );

    return BaseModel.fromMap(response);
  }

  @override
  Future<BaseModel> updateFamily(RequestParam param) async {
    final Map<String, dynamic> response = await httpHelper.post(
      url: ApiEndpoints.updateFamilyDetails,
      body: param.toMap(),
    );

    return BaseModel.fromMap(response);
  }

  @override
  Future<BaseModel> addFamilyMemebers(RequestParam param) async {
    final Map<String, dynamic> response = await httpHelper.post(
      url: ApiEndpoints.addFamilyMembers,
      body: param.toMap(),
    );

    return BaseModel.fromMap(response);
  }

  @override
  Future<BaseModel> listPendingFamily(NoParams param) async {
    final Map<String, dynamic> response = await httpHelper.get(
      ApiEndpoints.listPendingRequests,
    );

    return BaseModel.fromMap(response);
  }

  @override
  Future<FamilyUserCanJoinModel> listFamilyUserCanJoin(ListFamilyUserCanJoinParam param) async {
    final Map<String, dynamic> response = await httpHelper.get(
      "${ApiEndpoints.getFamilyListUserCanJoin}?search=asa",
    );

    return FamilyUserCanJoinModel.fromJson(response);
  }

  @override
  Future<BaseModel> getFamilyMembers(NoParams param) async {
    final Map<String, dynamic> response = await httpHelper.get(
      ApiEndpoints.getFamilyMembers,
    );

    return BaseModel.fromMap(response);
  }

  @override
  Future<BaseModel> getFamilyDetails(RequestParam param) async {
    final Map<String, dynamic> response = await httpHelper.get(
      ApiEndpoints.getFamilyDetails,
    );

    return BaseModel.fromMap(response);
  }

  @override
  Future<BaseModel> requestToJoinFamily(RequestParam param) async {
    final Map<String, dynamic> response = await httpHelper.get(
      ApiEndpoints.requestToJoinFamily,
    );

    return BaseModel.fromMap(response);
  }

  @override
  Future<BaseModel> acceptOrRejectRequest(RequestParam param) async {
    final Map<String, dynamic> response = await httpHelper.post(
      url: ApiEndpoints.acceptOrRejectRequest,
      body: param.toMap(),
    );

    return BaseModel.fromMap(response);
  }

  @override
  Future<BaseModel> getUserFamily(NoParams param) async {
    final Map<String, dynamic> response = await httpHelper.get(
      ApiEndpoints.getUserFamily,
    );

    return BaseModel.fromMap(response);
  }

  @override
  Future<UsersListModel> getUsers(GetUsersParam param) async {
    final Map<String, dynamic> response = await httpHelper.post(
      url: '${ApiEndpoints.getUsers}${param.searchParam}',
      body: param.toMap(),
    );

    return UsersListModel.fromJson(response);
  }
}

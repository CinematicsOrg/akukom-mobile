import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

abstract class ProfileRemoteDataSource {
  Future<EditProfileModel> editUserProfile(RequestParam param);

  Future<BaseModel> changePassword(RequestParam param);

  Future<BaseModel> deleteAccount(NoParams param);

  Future<BaseModel> deactivateAccount(NoParams param);

  Future<EditProfileModel> uploadProfilePicture(RequestParam param);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final HttpHelper httpHelper;

  ProfileRemoteDataSourceImpl({required this.httpHelper});

  @override
  Future<EditProfileModel> editUserProfile(RequestParam param) async {
    final Map<String, dynamic> response = await httpHelper.post(
      url: ApiEndpoints.editProfile,
      body: param.toMap(),
    );

    return EditProfileModel.fromJson(response);
  }

  @override
  Future<BaseModel> changePassword(RequestParam param) async {
    final Map<String, dynamic> response = await httpHelper.post(
      url: ApiEndpoints.profileChangePassword,
      body: param.toMap(),
    );

    return BaseModel.fromMap(response);
  }

  @override
  Future<BaseModel> deleteAccount(NoParams param) async {
    final Map<String, dynamic> response = await httpHelper.post(
      url: ApiEndpoints.profileDeleteAccount,
      body: {},
    );

    return BaseModel.fromMap(response);
  }

  @override
  Future<BaseModel> deactivateAccount(NoParams param) async {
    final Map<String, dynamic> response = await httpHelper.post(
      url: ApiEndpoints.profileDeactivateAccount,
      body: {},
    );

    return BaseModel.fromMap(response);
  }

  @override
  Future<EditProfileModel> uploadProfilePicture(RequestParam param) async {
    final UploadProfileImageParams params = param as UploadProfileImageParams;
    final mapEntryFuture = params.toFileMapEntry(); // This is a Future
    final mapEntry = await mapEntryFuture; // Wait for the Future to complete
    final List<MapEntry<String, http.MultipartFile>> files = [mapEntry];

    final Map<String, dynamic> response = await httpHelper.postMultipart(
      url: ApiEndpoints.uploadProfilePicture,
      files: files,
    );

    debugPrint('response: $response');

    return EditProfileModel.fromJson(response);
  }
}

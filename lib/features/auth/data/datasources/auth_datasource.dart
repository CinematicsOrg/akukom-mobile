import 'package:akukom/cores/base_request_body/base_request_body.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/utils/http_helper.dart';
import 'package:akukom/features/auth/__auth.dart';

abstract class AuthRemoteDataSource {
  Future<SignupModel> signup(RequestParam param);

  Future<BaseAuthModel> completeSignup(RequestParam param);

  Future<SignupModel> login(RequestParam param);

  Future<BaseModel> checkPhoneUsage(RequestParam param);

  Future<BaseAuthModel> verifyPhoneNumber(RequestParam param);

  Future<BaseModel> forgotPasswordOtp(RequestParam param);

  Future<BaseModel> forgotPasswordVerificationOtp(RequestParam param);

  Future<BaseModel> changePassword(RequestParam param);

  Future<BaseModel> refreshToken(RequestParam param);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final HttpHelper httpHelper;

  AuthRemoteDataSourceImpl({required this.httpHelper});

  @override
  Future<SignupModel> signup(RequestParam param) async {
    final Map<String, dynamic> response = await httpHelper.post(
      url: ApiEndpoints.signup,
      body: param.toMap(),
    );

    return SignupModel.fromJson(response);
  }

  @override
  Future<BaseAuthModel> completeSignup(
    RequestParam requestParam,
  ) async {
    final Map<String, dynamic> response = await httpHelper.post(
      url: ApiEndpoints.completeSignup,
      body: requestParam.toMap(),
    );

    return BaseAuthModel.fromJson(response);
  }

  @override
  Future<SignupModel> login(RequestParam param) async {
    final Map<String, dynamic> response = await httpHelper.post(
      url: ApiEndpoints.login,
      body: param.toMap(),
    );

    return SignupModel.fromJson(response);
  }

  @override
  Future<BaseModel> checkPhoneUsage(RequestParam param) async {
    final Map<String, dynamic> response = await httpHelper.post(
      url: ApiEndpoints.checkPhoneUsage,
      body: param.toMap(),
    );

    return BaseModel.fromMap(response);
  }

  @override
  Future<BaseAuthModel> verifyPhoneNumber(RequestParam param) async {
    final Map<String, dynamic> response = await httpHelper.post(
      url: ApiEndpoints.verifyPhoneNumber,
      body: param.toMap(),
    );

    return BaseAuthModel.fromJson(response);
  }

  @override
  Future<BaseModel> forgotPasswordOtp(RequestParam param) async {
    final Map<String, dynamic> response = await httpHelper.post(
      url: ApiEndpoints.forgotPasswordOtp,
      body: param.toMap(),
    );

    return BaseModel.fromMap(response);
  }

  @override
  Future<BaseModel> forgotPasswordVerificationOtp(
    RequestParam param,
  ) async {
    final Map<String, dynamic> response = await httpHelper.post(
      url: ApiEndpoints.forgotPasswordOtpVerification,
      body: param.toMap(),
    );

    return BaseModel.fromMap(response);
  }

  @override
  Future<BaseModel> changePassword(RequestParam param) async {
    final Map<String, dynamic> response = await httpHelper.post(
      url: ApiEndpoints.changePassword,
      body: param.toMap(),
    );

    return BaseModel.fromMap(response);
  }

  @override
  Future<BaseModel> refreshToken(RequestParam param) async {
    // final Map<String, dynamic> response = await httpHelper.post(
    //   url: ApiEndpoints.refreshToken,
    //   body: param.toMap(),
    // );

    // return BaseModel.fromMap(response);
    throw UnimplementedError();
  }
}

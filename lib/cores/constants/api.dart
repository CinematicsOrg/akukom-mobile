// ignore_for_file: prefer_const_declarations

// import 'package:flutter/foundation.dart';

// import '../../app/env.dart';
// import '../../app/locator.dart';

class ApiEndpoints {
  // static const String _versionOne = '/api/v1';
  // static const String _versionTwo = '/api/v2';

  // static const _isDebug = kDebugMode;

  // static final String _baseUrlV1 = (() {
  //   if (_isDebug) {
  //     return getIt<ENV>().apiBaseUrl + _versionOne;
  //   } else {
  //     return getIt<ENV>().prodApiBaseUrl + _versionOne;
  //   }
  // })();

  // static final String _baseUrlV2 = (() {
  //   if (_isDebug) {
  //     return getIt<ENV>().apiBaseUrl + _versionTwo;
  //   } else {
  //     return getIt<ENV>().prodApiBaseUrl + _versionTwo;
  //   }
  // })();

  // String get baseUrl => _baseUrlV1;

  static final String _baseUrl = 'https://akukom-backend.onrender.com';

  static final String _baseUrlV1 = '$_baseUrl/api/v1';

  /// Auth
  static final String signup = '$_baseUrlV1/auth/process/signup';
  static final String login = '$_baseUrlV1/auth/process/login';
  static final String checkPhoneUsage =
      '$_baseUrlV1/auth/process/check-phone-usage';
  static final String completeSignup =
      '$_baseUrlV1/auth/process/complete-signup';
  static final String verifyPhoneNumber =
      '$_baseUrlV1/auth/process/verify-phone-number';
  static final String forgotPasswordOtp =
      '$_baseUrlV1/auth/process/forgot-password-otp';
  static final String forgotPasswordOtpVerification =
      '$_baseUrlV1/auth/process/forgot-password-otp-verification';
  static final String changePassword =
      '$_baseUrlV1/auth/process/change-password';

  /// Profile
  static final String editProfile = '$_baseUrlV1/profile/edit-user-profile';
  static final String profileChangePassword =
      '$_baseUrlV1/profile/change-password';
  static final String profileDeleteAccount =
      '$_baseUrlV1/profile/delete-account';
  static final String profileDeactivateAccount =
      '$_baseUrlV1/profile/deactivate-account';
  static final String uploadProfilePicture =
      '$_baseUrlV1/profile/edit-profile-image';

  /// Family Group
  static final String createFamilyGroup = '$_baseUrlV1/family/create-family';
  static final String userInFamily = '$_baseUrlV1/family/user-in-family';
  static final String updateFamilyDetails =
      '$_baseUrlV1/family/update-family-details';
  static final String addFamilyDetails =
      '$_baseUrlV1/family/add-family-details';
  static final String addFamilyMembers =
      '$_baseUrlV1/family/add-family-members';
  static final String listPendingRequests =
      '$_baseUrlV1/family/list-pending-requests';
  static final String getFamilyListUserCanJoin =
      '$_baseUrlV1/family/get-family-list-user-can-join';
  static final String getFamilyMembers =
      '$_baseUrlV1/family/get-family-members';
  static final String getFamilyDetails =
      '$_baseUrlV1/family/get-family-details';
  static final String requestToJoinFamily =
      '$_baseUrlV1/family/request-to-join-family';
  static final String acceptOrRejectRequest =
      '$_baseUrlV1/family/accept-pending-requests';
  static final String getUserFamily = '$_baseUrlV1/family/get-users-family';
  static final String getUsers = '$_baseUrlV1/profile/get-users';

  /// Family Event
  static final String createFamilyEvent =
      '$_baseUrlV1/family/create-family-event/';
  static final String getFamilyEvents = '$_baseUrlV1/family/get-family-events';
}

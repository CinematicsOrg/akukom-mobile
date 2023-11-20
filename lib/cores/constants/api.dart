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
  static final String checkPhoneUsage = '$_baseUrlV1/auth/process/check-phone-usage';
  static final String completeSignup = '$_baseUrlV1/auth/process/complete-signup';
  static final String verifyPhoneNumber = '$_baseUrlV1/auth/process/verify-phone-number';
  static final String forgotPasswordOtp = '$_baseUrlV1/auth/process/forgot-password-otp';
  static final String forgotPasswordOtpVerification = '$_baseUrlV1/auth/process/forgot-password-otp-verification';
  static final String changePassword = '$_baseUrlV1/auth/process/change-password';
  // static final String verifyPhoneNumber = '$_baseUrlV1/auth/process/verify-phone-number';
}

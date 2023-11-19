import 'package:flutter/foundation.dart';

import '../../app/env.dart';
import '../../app/locator.dart';

class ApiEndpoints {
  static const String _versionOne = '/api/v1';
  static const String _versionTwo = '/api/v2';

  static const _isDebug = kDebugMode;

  static final String _baseUrlV1 = (() {
    if (_isDebug) {
      return getIt<ENV>().apiBaseUrl + _versionOne;
    } else {
      return getIt<ENV>().prodApiBaseUrl + _versionOne;
    }
  })();

  static final String _baseUrlV2 = (() {
    if (_isDebug) {
      return getIt<ENV>().apiBaseUrl + _versionTwo;
    } else {
      return getIt<ENV>().prodApiBaseUrl + _versionTwo;
    }
  })();

  String get baseUrl => _baseUrlV1;

  /// Auth
  static final String login = '$_baseUrlV2/auth/login';
  static final String logout = '$_baseUrlV1/auth/logout';
}

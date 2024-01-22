// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../navigator/navigator.dart';
import '../shared_session/session_manager.dart';
import 'logger.dart';

class HttpHelper {
  final Client client;
  final AppRouter appRouter;
  // final CrashLogger crashLogger;

  HttpHelper({
    required this.client,
    required this.appRouter,
    // required this.crashLogger,
  });

  Future<Map<String, String>> headers() async {
    final token = await SessionManager.instance.bearerToken;
    debugPrint('token: $token');
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
      'platform': Platform.operatingSystem,
      // 'version': (await PackageInfo.fromPlatform()).version.substring(0, 4),
    };
  }

  Future<Map<String, dynamic>> postMultipart({
    required String url,
    required List<MapEntry<String, http.MultipartFile>> files,
  }) async {
    try {
      final Map<String, String> header = await headers();
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add files to the request
      for (var fileEntry in files) {
        request.files.add(fileEntry.value);
      }

      // Add headers to the request
      request.headers.addAll(header);

      // Send the request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      final Map<String, dynamic> result = json.decode(response.body);

      if ((response.statusCode ~/ 100) == 2) {
        return result;
      } else {
        // Handle specific status codes as needed
        throw 'Error: ${result['message']}';
      }
    } on FormatException catch (e) {
      // This exception is thrown when the response body could not be parsed.
      throw 'Unable to format data: $e';
    } on http.ClientException catch (e) {
      // This includes SocketException for network issues.
      throw 'Client Exception: $e';
    } on TimeoutException catch (e) {
      // This exception is thrown when a timeout has occurred.
      throw 'Timeout Exception: $e';
    } catch (e) {
      // Generic catch-all for any other exceptions that might occur.
      throw 'An unexpected error occurred: $e';
    }
  }

  Future<Map<String, dynamic>> postMultipartWithFields<T>({
    required String url,
    required List<MapEntry<String, http.MultipartFile>> files,
    required T fields,
  }) async {
    try {
      final Map<String, String> header = await headers();
      var request = http.MultipartRequest('POST', Uri.parse(url));

      if (fields is Map<String, String>) {
        request.fields.addAll(fields);
      } else {
        // Handle other types of fields if needed
        throw ArgumentError("Unsupported field type: ${fields.runtimeType}");
      }

      for (var fileEntry in files) {
        request.files.add(fileEntry.value);
      }

      request.headers.addAll(header);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      final Map<String, dynamic> result = json.decode(response.body);

      if ((response.statusCode ~/ 100) == 2) {
        return result;
      } else {
        throw 'Error: ${result['message']}';
      }
    } on FormatException catch (e) {
      throw 'Unable to format data: $e';
    } on http.ClientException catch (e) {
      throw 'Client Exception: $e';
    } on TimeoutException catch (e) {
      throw 'Timeout Exception: $e';
    } catch (e) {
      throw 'An unexpected error occurred: $e';
    }
  }

  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, dynamic>? query,
  }) async {
    try {
      final Map<String, String> header = await headers();

      if (query != null) {
        url += '?';

        query.forEach((key, value) {
          bool isFirst = query.keys.toList().indexOf(key) == 0;
          if (isFirst) {
            url += '$key=$value';
          } else {
            url += '&$key=$value';
          }
        });
      }

      LoggerHelper.log(url);
      LoggerHelper.log(query);
      LoggerHelper.log("header: $header");

      Response response = await client
          .get(Uri.parse(url), headers: header)
          .timeout(const Duration(seconds: 50));

      LoggerHelper.log(response.body);

      final Map<String, dynamic> result = json.decode(response.body);

      // Log Endpoint
      // crashLogger.endpointLogData(
      //   url: url,
      //   header: header,
      //   response: response.body,
      // );

      if ((response.statusCode ~/ 100) == 2) {
        return result;
      } else if (response.statusCode == 404) {
        throw 'Route not found, Please contact support';
      } else if (response.statusCode == 401) {
        appRouter.logOut();
        throw "Session has expired, please login";
      } else {
        throw result['message'];
      }
    } on FormatException catch (e, s) {
      LoggerHelper.log(e, s);
      if (kDebugMode) {
        throw 'Unable To Format Data!';
      }

      throw 'Something went wrong, please try again';
    } on SocketException catch (e, s) {
      LoggerHelper.log(e, s);
      throw 'Unable to connect to server please check your network and try again!';
    } on TimeoutException catch (e, s) {
      LoggerHelper.log(e, s);
      throw 'Unable to connect to server please check your network and try again!';
    } catch (e) {
      throw e.toString();
    }
  }

  /// Make an [Http] post request
  Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? query,
    Duration? timeoutDuration,
  }) async {
    final Map<String, String> header = await headers();

    try {
      if (query != null) {
        url += '?';
        query.forEach((key, value) => url += '&$key=$value');
      }

      LoggerHelper.log(url);
      LoggerHelper.log(query);
      LoggerHelper.log(body);
      LoggerHelper.log("header: $header");

      final bodyData = json.encode(body);
      Response response = await client
          .post(
            Uri.parse(url),
            headers: header,
            body: bodyData,
          )
          .timeout(timeoutDuration ?? const Duration(seconds: 50));

      LoggerHelper.log(response.body);

      final Map<String, dynamic> result = json.decode(response.body);

      LoggerHelper.log(result);

      // Log Endpoint
      // crashLogger.endpointLogData(
      //   url: url,
      //   header: header,
      //   body: body,
      //   response: response.body,
      // );

      if ((response.statusCode ~/ 100) == 2) {
        return result;
      } else if (response.statusCode == 404) {
        throw 'Route not found, Please contact support';
      } else {
        throw checkForError(result);
      }
    } on FormatException catch (e, s) {
      LoggerHelper.log(e, s);
      if (kDebugMode) {
        throw 'Unable To Format Data!';
      }

      throw 'Something went wrong, please try again';
    } on TimeoutException catch (e, s) {
      LoggerHelper.log(e, s);
      throw 'Request Timeout, Unable to connect to server please check your network and try again!';
    } on SocketException catch (e, s) {
      LoggerHelper.log(e, s);
      throw 'Unable to connect to server please check your network and try again!';
    } catch (e) {
      throw e.toString();
    }
  }

  /// Make an [Http] put request
  Future<Map<String, dynamic>> put({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      // Log Endpoint
      final Map<String, String> header = await headers();

      LoggerHelper.log(url);
      LoggerHelper.log(body);
      LoggerHelper.log("header: ${await headers()}");

      Response response = await client
          .put(Uri.parse(url), headers: header, body: json.encode(body))
          .timeout(const Duration(seconds: 50));

      LoggerHelper.log(response.body);

      final Map<String, dynamic> result = json.decode(response.body);

      // Log Endpoint
      // crashLogger.endpointLogData(
      //   url: url,
      //   header: header,
      //   body: body,
      //   response: response.body,
      // );

      if ((response.statusCode ~/ 100) == 2) {
        return result;
      } else if (response.statusCode == 404) {
        throw 'Route not found, Please contact support';
      } else {
        throw checkForError(result);
      }
    } on FormatException catch (e, s) {
      LoggerHelper.log(e, s);
      if (kDebugMode) {
        throw 'Unable To Format Data!';
      }

      throw 'Something went wrong, please try again';
    } on TimeoutException catch (e, s) {
      LoggerHelper.log(e, s);
      throw 'Request Timeout, Unable to connect to server please check your network and try again!';
    } on SocketException catch (e, s) {
      LoggerHelper.log(e, s);
      throw 'Unable to connect to server please check your network and try again!';
    } catch (e) {
      throw e.toString();
    }
  }

  /// Make an [Http] delete request
  Future<Map<String, dynamic>> delete({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? query,
  }) async {
    try {
      final Map<String, String> header = await headers();

      if (query != null) {
        url += '?';
        query.forEach((key, value) => url += '&$key=$value');
      }

      LoggerHelper.log(url);
      LoggerHelper.log(query);
      LoggerHelper.log(body);
      LoggerHelper.log("header: ${await headers()}");

      Response response = await client
          .delete(Uri.parse(url), headers: header, body: json.encode(body))
          .timeout(const Duration(seconds: 50));

      LoggerHelper.log(response.body);

      final Map<String, dynamic> result = json.decode(response.body);

      // Log Endpoint
      // crashLogger.endpointLogData(
      //   url: url,
      //   header: header,
      //   body: body,
      //   response: response.body,
      // );

      if ((response.statusCode ~/ 100) == 2) {
        return result;
      } else if (response.statusCode == 404) {
        throw 'Route not found, Please contact support';
      } else {
        throw checkForError(result);
      }
    } on FormatException catch (e, s) {
      LoggerHelper.log(e, s);
      if (kDebugMode) {
        throw 'Unable To Format Data!';
      }

      throw 'Something went wrong, please try again';
    } on TimeoutException catch (e, s) {
      LoggerHelper.log(e, s);
      throw 'Request Timeout, Unable to connect to server please check your network and try again!';
    } on SocketException catch (e, s) {
      LoggerHelper.log(e, s);
      throw 'Unable to connect to server please check your network and try again!';
    } catch (e) {
      throw e.toString();
    }
  }

  //! Todo: Refactor this method to use status code
  static String checkForError(Map data) {
    if (data['error'] != null ||
        data['state'] == "error" ||
        (data['statusCode'] != null && data['statusCode'] ~/ 2 != 1) ||
        (data['status'] != null && data['status'] ~/ 2 != 1)) {
      if (data['message'] is List<dynamic>) {
        throw data['message'].join(', ');
      }
      final String? message = data['message'] ?? data['msg'];

      if (message != null) throw message;

      final Map<String, dynamic> errorMap = Map.from(data['error']);
      return errorMap.values.join('\n');
    }

    return 'Something went wrong, Please try again';
  }
}

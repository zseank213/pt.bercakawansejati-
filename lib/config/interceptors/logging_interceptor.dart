import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// This file holds the functions to be used in interceptors to include logging
class LoggingInterceptor {
  /// Error Interceptor for logging in information
  printError(
    DioError dioError,
  ) {
    debugPrint(
        "<-- ${dioError.message} ${dioError.response!.requestOptions.baseUrl + dioError.response!.requestOptions.path}");
    debugPrint(
        "${dioError.response != null ? dioError.response!.data : 'Unknown Error'}");
    debugPrint("<-- End error");
  }

  /// Prints Successful response
  printSuccess(Response response) {
    debugPrint(
        "<-- ${response.statusCode} ${response.requestOptions.baseUrl + response.requestOptions.path}");
    // debugPrint("Headers:");
    // response.headers.forEach((k, v) => debugPrint('$k: $v'));
    log("Response: ${jsonEncode(response.data)}");
    debugPrint("<-- END HTTP");
  }

  /// Prints request
  ///
  /// Prints body if it has body
  /// Prints headers, even if does not have headers
  printRequest(RequestOptions options) {
    debugPrint(
        "--> ${options.method.toUpperCase()} ${"" + (options.baseUrl) + (options.path)}");
    debugPrint("Headers:");
    options.headers.forEach((k, v) => debugPrint('$k: $v'));
    debugPrint("queryParameters:");
    options.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
    debugPrint("Body: ${options.data}");
    debugPrint("--> END ${options.method.toUpperCase()}");

    return options;
  }
}

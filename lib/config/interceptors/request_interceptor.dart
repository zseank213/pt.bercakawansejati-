import 'dart:async';
import 'package:dio/dio.dart';
import 'package:pt_berca_kawan_sejati/lib.dart';

class RequestInterceptor {
  final LoggingInterceptor _loggingInterceptor;

  RequestInterceptor(this._loggingInterceptor);

  /// Generates the Request Interceptor
  ///
  /// [requestOptions] request options
  Future<RequestOptions> getRequestInterceptor({required RequestOptions requestOptions}) async {
    _loggingInterceptor.printRequest(requestOptions);
    return requestOptions;
  }
}

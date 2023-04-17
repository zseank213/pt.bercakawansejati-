import 'package:dio/dio.dart';
import 'package:pt_berca_kawan_sejati/lib.dart';

class ResponseInterceptor {
  final LoggingInterceptor _loggingInterceptor;

  ResponseInterceptor(this._loggingInterceptor);

  /// Intercepts the response so that we can validate its integrity
  Response getResponseInterceptor({required Response response}) {
    _loggingInterceptor.printSuccess(response);
    return response;
  }
}

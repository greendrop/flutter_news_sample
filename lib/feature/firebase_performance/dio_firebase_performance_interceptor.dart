// Ref: https://github.com/darkxanter/firebase_performance_dio/blob/master/lib/src/firebase_performance_dio.dart

// ignore_for_file: lines_longer_than_80_chars

import 'package:dio/dio.dart';
import 'package:firebase_performance/firebase_performance.dart';

/// [Dio] client interceptor that hooks into request/response process
/// and calls Firebase Metric API in between. The [HttpMetric] stored in [RequestOptions.extra] field.
///
/// Additionally there is no good API of obtaining content length from interceptor
/// API so we're "approximating" the byte length based on headers & request data.
/// If you're not fine with this, you can provide your own implementation in the constructor
///
/// This interceptor might be counting parsing time into elapsed API call duration.
/// I am not fully aware of [Dio] internal architecture.
class DioFirebasePerformanceInterceptor extends Interceptor {
  DioFirebasePerformanceInterceptor({
    this.requestContentLengthMethod = defaultRequestContentLength,
    this.responseContentLengthMethod = defaultResponseContentLength,
    this.requestUrlBuilder = defaultRequestUrl,
  });
  final RequestContentLengthMethod requestContentLengthMethod;
  final ResponseContentLengthMethod responseContentLengthMethod;
  final RequestUrlBuilder requestUrlBuilder;
  static const extraKey = 'DioFirebasePerformanceInterceptor';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final metric = FirebasePerformance.instance.newHttpMetric(
        requestUrlBuilder(options),
        options.method.asHttpMethod()!,
      );
      options.extra[extraKey] = metric;
      final requestContentLength = requestContentLengthMethod(options);
      await metric.start();
      if (requestContentLength != null) {
        metric.requestPayloadSize = requestContentLength;
      }
    } on Exception catch (_) {}
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    // ignore: strict_raw_type
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    await _stopMetric(response, response.requestOptions);
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    await _stopMetric(err.response, err.requestOptions);
    return super.onError(err, handler);
  }

  // ignore: strict_raw_type
  Future<void> _stopMetric(Response? response, RequestOptions options) async {
    try {
      final metric = options.extra[extraKey];
      if (metric is HttpMetric) {
        options.extra.remove(extraKey);
        metric.setResponse(response, responseContentLengthMethod);
        await metric.stop();
      }
    } on Exception catch (_) {}
  }
}

typedef RequestContentLengthMethod = int? Function(RequestOptions options);
int? defaultRequestContentLength(RequestOptions options) {
  try {
    return options.headers.toString().length + options.data.toString().length;
  } on Exception catch (_) {
    return null;
  }
}

// ignore: strict_raw_type
typedef ResponseContentLengthMethod = int? Function(Response options);
// ignore: strict_raw_type
int? defaultResponseContentLength(Response response) {
  try {
    final lengthHeader = response.headers[Headers.contentLengthHeader]?.first;
    var length = int.parse(lengthHeader ?? '-1');
    if (length <= 0) {
      final headers = response.headers.toString().length;
      length = headers + response.data.toString().length;
    }
    return length;
  } on Exception catch (_) {
    return null;
  }
}

extension _ResponseHttpMetric on HttpMetric {
  void setResponse(
    // ignore: strict_raw_type
    Response? value,
    ResponseContentLengthMethod responseContentLengthMethod,
  ) {
    if (value == null) {
      return;
    }
    final responseContentLength = responseContentLengthMethod(value);
    if (responseContentLength != null) {
      responsePayloadSize = responseContentLength;
    }
    final contentType = value.headers.value.call(Headers.contentTypeHeader);
    if (contentType != null) {
      responseContentType = contentType;
    }
    if (value.statusCode != null) {
      httpResponseCode = value.statusCode;
    }
  }
}

typedef RequestUrlBuilder = String Function(RequestOptions options);
String defaultRequestUrl(RequestOptions options) {
  return options.uri.normalized();
}

extension _UriHttpMethod on Uri {
  String normalized() {
    // ignore: prefer_single_quotes
    return "$scheme://$host$path";
  }
}

extension _StringHttpMethod on String {
  HttpMethod? asHttpMethod() {
    switch (toUpperCase()) {
      case 'POST':
        return HttpMethod.Post;
      case 'GET':
        return HttpMethod.Get;
      case 'DELETE':
        return HttpMethod.Delete;
      case 'PUT':
        return HttpMethod.Put;
      case 'PATCH':
        return HttpMethod.Patch;
      case 'OPTIONS':
        return HttpMethod.Options;
      default:
        return null;
    }
  }
}

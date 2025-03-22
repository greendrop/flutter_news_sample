import 'package:app/feature/firebase_performance/dio_firebase_performance_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_api_dio.g.dart';

@riverpod
Dio newsApiDio(Ref ref) {
  final dio = Dio();
  dio.interceptors.add(DioFirebasePerformanceInterceptor());
  return dio;
}

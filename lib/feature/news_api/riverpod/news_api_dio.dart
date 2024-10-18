import 'package:dio/dio.dart';
import 'package:flutter_news_sample/feature/firebase_performance/dio_firebase_performance_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_api_dio.g.dart';

@riverpod
Dio newsApiDio(
  NewsApiDioRef ref,
) {
  final dio = Dio();
  dio.interceptors.add(DioFirebasePerformanceInterceptor());
  return dio;
}

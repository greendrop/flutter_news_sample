import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_api_dio.g.dart';

@riverpod
Dio newsApiDio(
  NewsApiDioRef ref,
) {
  return Dio();
}

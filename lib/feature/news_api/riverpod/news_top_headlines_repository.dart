import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/news_api/repository/news_top_headlines_repository.dart';
import 'package:flutter_news_sample/feature/news_api/riverpod/news_api_dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_top_headlines_repository.g.dart';

@riverpod
NewsTopHeadlinesRepository newsTopHeadlinesRepository(
  NewsTopHeadlinesRepositoryRef ref,
) {
  final appLogger = ref.read(appLoggerProvider);
  final dio = ref.read(newsApiDioProvider);
  return NewsTopHeadlinesRepository(ref: ref, logger: appLogger, dio: dio);
}

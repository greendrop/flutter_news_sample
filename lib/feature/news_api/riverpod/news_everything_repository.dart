import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/news_api/repository/news_everything_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_everything_repository.g.dart';

@riverpod
NewsEverythingRepository newsEverythingRepository(
  NewsEverythingRepositoryRef ref,
) {
  final appLogger = ref.read(appLoggerProvider);
  return NewsEverythingRepository(ref: ref, logger: appLogger);
}

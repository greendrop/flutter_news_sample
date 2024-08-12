import 'package:flutter_news_sample/feature/news_api/repository/news_everything_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_everything_repository.g.dart';

@riverpod
NewsEverythingRepository newsEverythingRepository(
  NewsEverythingRepositoryRef ref,
) {
  return NewsEverythingRepository(ref: ref);
}

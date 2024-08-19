import 'package:flutter_news_sample/feature/app_logger/repository/app_logger_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_logger_directory_repository.g.dart';

@riverpod
AppLoggerDirectoryRepository appLoggerDirectoryRepository(
  AppLoggerDirectoryRepositoryRef ref,
) {
  return AppLoggerDirectoryRepository(ref: ref);
}

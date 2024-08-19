import 'package:flutter_news_sample/feature/app_log_list/ripository/app_log_files_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_log_files_repository.g.dart';

@riverpod
AppLogFilesRepository appLogFilesRepository(AppLogFilesRepositoryRef ref) {
  return AppLogFilesRepository(ref: ref);
}

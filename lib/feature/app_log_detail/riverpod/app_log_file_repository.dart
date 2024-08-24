import 'package:flutter_news_sample/feature/app_log_detail/repository/app_log_file_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_log_file_repository.g.dart';

@riverpod
AppLogFileRepository appLogFileRepository(AppLogFileRepositoryRef ref) {
  return AppLogFileRepository(ref: ref);
}

import 'package:app/feature/app_logger/repository/app_logger_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_logger_directory_repository.g.dart';

@riverpod
AppLoggerDirectoryRepository appLoggerDirectoryRepository(Ref ref) {
  return AppLoggerDirectoryRepository(ref: ref);
}

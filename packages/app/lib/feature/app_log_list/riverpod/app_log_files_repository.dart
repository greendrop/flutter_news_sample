import 'package:app/feature/app_log_list/repository/app_log_files_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_log_files_repository.g.dart';

@riverpod
AppLogFilesRepository appLogFilesRepository(Ref ref) {
  return AppLogFilesRepository(ref: ref);
}

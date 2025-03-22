import 'package:app/feature/app_log_detail/repository/app_log_file_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_log_file_repository.g.dart';

@riverpod
AppLogFileRepository appLogFileRepository(Ref ref) {
  return AppLogFileRepository(ref: ref);
}

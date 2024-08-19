import 'package:flutter_news_sample/exception/app_exception.dart';
import 'package:flutter_news_sample/feature/app_log_list/entity/app_log_file.dart';
import 'package:flutter_news_sample/feature/app_log_list/riverpod/app_log_files_repository.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger_directory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_log_files_notifier.g.dart';

const String _notifierName = 'AppLogFilesNotifier';

@riverpod
class AppLogFilesNotifier extends _$AppLogFilesNotifier {
  @override
  FutureOr<List<AppLogFile>> build() => [];

  Future<void> fetch({bool isRefresh = false}) async {
    if (state.isLoading) {
      return Future.value();
    }

    final appLogger = ref.read(appLoggerProvider)
      ..i([
        '$_notifierName#fetch',
        {'isRefresh': isRefresh},
      ]);

    if (isRefresh) {
      state =
          const AsyncValue<List<AppLogFile>>.loading().copyWithPrevious(state);
    } else {
      state = const AsyncValue<List<AppLogFile>>.loading();
    }

    final directory = ref.watch(appLoggerDirectoryProvider);
    if (directory == null) {
      state = const AsyncValue.data([]);
      return Future.value();
    }

    try {
      final value = await ref
          .read(appLogFilesRepositoryProvider)
          .fetch(directory: directory);
      final appLogFiles = value
          .where((element) => element.path.endsWith('.log'))
          .map((element) => AppLogFile(path: element.path))
          .toList();
      state = AsyncValue.data(appLogFiles);
      return Future.value();
    } on Exception catch (e) {
      appLogger.e(
        [
          '$_notifierName#fetch',
          {'isRefresh': isRefresh, 'Exception': e},
        ],
      );
      final appException =
          e is AppException ? e : AppException(parentException: e);

      if (isRefresh) {
        state = AsyncValue<List<AppLogFile>>.error(e, StackTrace.current)
            .copyWithPrevious(state);
      } else {
        state = AsyncValue<List<AppLogFile>>.error(e, StackTrace.current);
      }
      return Future.error(appException);
    }
  }
}

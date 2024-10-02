import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_log_list/entity/app_log_file.dart';
import 'package:flutter_news_sample/feature/app_log_list/riverpod/app_log_files_notifier.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UseAppLogFilesReturn = ({
  AsyncValue<List<AppLogFile>> state,
  Future<void> Function({bool isRefresh}) fetch,
});

typedef UseAppLogFiles = UseAppLogFilesReturn Function();

const String _hookName = 'useAppLogFiles';

UseAppLogFilesReturn useAppLogFilesImpl() {
  final context = useContext();
  final ref = context as WidgetRef;

  final state = ref.watch(appLogFilesNotifierProvider);

  final fetch = useCallback(
    ({bool isRefresh = false}) {
      ref.read(appLoggerProvider).i([
        '$_hookName#fetch',
        {'isRefresh': isRefresh},
      ]);
      return ref
          .read(appLogFilesNotifierProvider.notifier)
          .fetch(isRefresh: isRefresh);
    },
    [state],
  );

  return (
    state: state,
    fetch: fetch,
  );
}

final UseAppLogFiles useAppLogFiles = useAppLogFilesImpl;

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_log_detail/riverpod/app_log_file_content_notifier.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UseAppLogFileContentReturn = ({
  AsyncValue<String> state,
  Future<void> Function() fetch,
});

typedef UseAppLogFileContent = UseAppLogFileContentReturn Function({
  required String filename,
});

const String _hookName = 'useAppLogFileContent';

UseAppLogFileContentReturn useAppLogFileContent({
  required String filename,
}) {
  final context = useContext();
  final ref = context as WidgetRef;

  final state =
      ref.watch(appLogFileContentNotifierProvider(filename: filename));

  final fetch = useCallback(
    () {
      ref.read(appLoggerProvider).i(
        [
          '$_hookName#fetch',
          {'filename': filename},
        ],
      );
      return ref
          .read(
            appLogFileContentNotifierProvider(filename: filename).notifier,
          )
          .fetch();
    },
    [],
  );

  return (
    state: state,
    fetch: fetch,
  );
}

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_log_detail/riverpod/app_logger_file_content_notifier.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UseAppLoggerFileContentReturn = ({
  AsyncValue<String> state,
  Future<void> Function() fetch,
});

typedef UseAppLoggerFileContent = UseAppLoggerFileContentReturn Function();

const String _hookName = 'useAppLoggerFileContent';

UseAppLoggerFileContentReturn useAppLoggerFileContent({
  required String filename,
}) {
  final context = useContext();
  final ref = context as WidgetRef;

  final state =
      ref.watch(appLoggerFileContentNotifierProvider(filename: filename));

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
            appLoggerFileContentNotifierProvider(filename: filename).notifier,
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

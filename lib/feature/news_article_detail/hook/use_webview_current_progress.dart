import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/news_article_detail/riverpod/webview_current_progress_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UseWebViewCurrentProgressReturn = ({
  int state,
  // ignore: avoid_positional_boolean_parameters
  void Function(int) setState,
});

typedef UseWebViewCurrentProgress = UseWebViewCurrentProgressReturn Function();

const String _hookName = 'useWebViewCurrentProgress';

UseWebViewCurrentProgressReturn useWebViewCurrentProgress() {
  final context = useContext();
  final ref = context as WidgetRef;

  final state = ref.watch(webViewCurrentProgressNotifierProvider);

  final setState = useCallback(
    (int value) {
      ref.read(appLoggerProvider).i(
        {'message': '$_hookName#setState', 'value': value},
      );
      return ref
          .read(webViewCurrentProgressNotifierProvider.notifier)
          .setState(value);
    },
    [state],
  );

  return (
    state: state,
    setState: setState,
  );
}

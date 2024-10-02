import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/news_article_detail/riverpod/webview_current_url_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UseWebViewCurrentUrlReturn = ({
  String state,
  // ignore: avoid_positional_boolean_parameters
  void Function(String) setState,
});

typedef UseWebViewCurrentUrl = UseWebViewCurrentUrlReturn Function();

const String _hookName = 'useWebViewCurrentUrl';

UseWebViewCurrentUrlReturn useWebViewCurrentUrlImpl() {
  final context = useContext();
  final ref = context as WidgetRef;

  final state = ref.watch(webViewCurrentUrlNotifierProvider);

  final setState = useCallback(
    (String value) {
      ref.read(appLoggerProvider).i(
        {'message': '$_hookName#setState', 'value': value},
      );
      return ref
          .read(webViewCurrentUrlNotifierProvider.notifier)
          .setState(value);
    },
    [state],
  );

  return (
    state: state,
    setState: setState,
  );
}

final UseWebViewCurrentUrl useWebViewCurrentUrl = useWebViewCurrentUrlImpl;

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/news_article_detail/riverpod/webview_request_go_back_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UseWebViewRequestGoBackReturn = ({
  bool state,
  // ignore: avoid_positional_boolean_parameters
  void Function(bool) setState,
});

typedef UseWebViewRequestGoBack = UseWebViewRequestGoBackReturn Function();

const String _hookName = 'useWebViewRequestGoBack';

UseWebViewRequestGoBackReturn useWebViewRequestGoBackImpl() {
  final context = useContext();
  final ref = context as WidgetRef;

  final state = ref.watch(webViewRequestGoBackNotifierProvider);

  final setState = useCallback(
    (bool value) {
      ref.read(appLoggerProvider).i(
            {'message': '$_hookName#setState', 'value': value.toString()}
                .toString(),
          );
      return ref
          .read(webViewRequestGoBackNotifierProvider.notifier)
          .setState(value);
    },
    [state],
  );

  return (
    state: state,
    setState: setState,
  );
}

final UseWebViewRequestGoBack useWebViewRequestGoBack =
    useWebViewRequestGoBackImpl;

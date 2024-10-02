import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_news_sample/feature/news_article_detail/riverpod/webview_request_go_back_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UseWebViewRequestGoBackEffect = void Function({
  required ObjectRef<InAppWebViewController?> webViewController,
});

void useWebViewRequestGoBackEffectImpl({
  required ObjectRef<InAppWebViewController?> webViewController,
}) {
  final context = useContext();
  final ref = context as WidgetRef;

  final requestGoBack = ref.watch(webViewRequestGoBackNotifierProvider);
  useEffect(
    () {
      if (requestGoBack) {
        Future.delayed(Duration.zero, () async {
          if (await webViewController.value?.canGoBack() ?? false) {
            await webViewController.value?.goBack();
          }
          await ref
              .read(webViewRequestGoBackNotifierProvider.notifier)
              .setState(false);
        });
      }
      return () {};
    },
    [requestGoBack],
  );
}

final UseWebViewRequestGoBackEffect useWebViewRequestGoBackEffect =
    useWebViewRequestGoBackEffectImpl;

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

typedef UseWebViewCanGoBackEffect = void Function({
  required ObjectRef<InAppWebViewController?> webViewController,
  // ignore: avoid_positional_boolean_parameters
  required void Function(bool) setWebviewCanGoBack,
});

void useWebViewCanGoBackEffectImpl({
  required ObjectRef<InAppWebViewController?> webViewController,
  // ignore: avoid_positional_boolean_parameters
  required void Function(bool) setWebviewCanGoBack,
}) {
  final canGoBackSnapshot = useFuture(webViewController.value?.canGoBack());
  useEffect(
    () {
      Future.delayed(Duration.zero, () {
        setWebviewCanGoBack(canGoBackSnapshot.data ?? false);
      });
      return () {};
    },
    [canGoBackSnapshot.data],
  );
}

final UseWebViewCanGoBackEffect useWebViewCanGoBackEffect =
    useWebViewCanGoBackEffectImpl;

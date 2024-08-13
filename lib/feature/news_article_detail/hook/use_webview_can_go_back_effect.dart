import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void useWebViewCanGoBackEffect({
  required ObjectRef<InAppWebViewController?> webViewController,
  // ignore: avoid_positional_boolean_parameters
  required void Function(bool) setCanGoBack,
}) {
  final canGoBackSnapshot = useFuture(webViewController.value?.canGoBack());
  useEffect(
    () {
      Future.delayed(Duration.zero, () {
        setCanGoBack(canGoBackSnapshot.data ?? false);
      });
      return () {};
    },
    [canGoBackSnapshot.data],
  );
}

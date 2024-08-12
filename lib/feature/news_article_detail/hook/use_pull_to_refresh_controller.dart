import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

PullToRefreshController? usePullToRefreshController({
  required ObjectRef<InAppWebViewController?> webViewController,
}) {
  if (kIsWeb) {
    return null;
  }

  return PullToRefreshController(
    settings: PullToRefreshSettings(),
    onRefresh: () async {
      if (defaultTargetPlatform == TargetPlatform.android) {
        await webViewController.value?.reload();
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        await webViewController.value?.loadUrl(
          urlRequest: URLRequest(url: await webViewController.value?.getUrl()),
        );
      }
    },
  );
}

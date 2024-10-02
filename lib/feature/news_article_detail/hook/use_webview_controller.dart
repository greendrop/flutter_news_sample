import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

typedef UseWebViewController = ObjectRef<InAppWebViewController?> Function();

ObjectRef<InAppWebViewController?> useWebViewControllerImpl() {
  return useRef<InAppWebViewController?>(null);
}

final UseWebViewController useWebViewController = useWebViewControllerImpl;

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

ObjectRef<InAppWebViewController?> useWebViewController() {
  return useRef<InAppWebViewController?>(null);
}

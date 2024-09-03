import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_pull_to_refresh_controller.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_webview_can_go_back.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_webview_can_go_back_effect.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_webview_controller.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_webview_current_progress.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_webview_current_url.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_webview_request_go_back_effect.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_webview_vertical_scroll.dart';
import 'package:flutter_news_sample/feature/url_launcher/hook/use_url_launcher.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsArticleDetailWebView extends HookConsumerWidget {
  const NewsArticleDetailWebView({
    super.key,
    required this.url,
    this.isDummyWebView = false,
  });

  final String url;
  final bool isDummyWebView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isDummyWebView ||
        (defaultTargetPlatform != TargetPlatform.android &&
            defaultTargetPlatform != TargetPlatform.iOS)) {
      return const Center(
        child: Text('WebView is not supported on this platform'),
      );
    }

    final appLogger = useAppLogger();
    final webViewKey = useMemoized(GlobalKey.new);
    final webViewController = useWebViewController();
    final webViewVerticalScroll = useWebviewVerticalScroll();
    final webViewSettings = useMemoized(_buildWebViewSettings);
    final pullToRefreshController = useMemoized(
      () => usePullToRefreshController(webViewController: webViewController),
    );
    final webViewCurrentUrl = useWebViewCurrentUrl();
    final webViewCurrentProgress = useWebViewCurrentProgress();
    final webViewCanGoBack = useWebViewCanGoBack();
    final urlLauncher = useUrlLauncher();

    useWebViewCanGoBackEffect(
      webViewController: webViewController,
      setWebviewCanGoBack: webViewCanGoBack.setState,
    );
    useWebViewRequestGoBackEffect(
      webViewController: webViewController,
    );

    return Stack(
      children: [
        InAppWebView(
          key: webViewKey,
          gestureRecognizers: const {
            Factory<VerticalDragGestureRecognizer>(
              VerticalDragGestureRecognizer.new,
            ),
          },
          onScrollChanged: (controller, x, y) {
            webViewVerticalScroll.updatePosition(y);
          },
          initialUrlRequest: URLRequest(url: WebUri(url)),
          initialSettings: webViewSettings,
          pullToRefreshController: pullToRefreshController,
          onWebViewCreated: (controller) {
            webViewController.value = controller;
          },
          onLoadStart: (controller, url) {
            webViewCurrentUrl.setState(url.toString());
          },
          onPermissionRequest: (controller, request) async {
            return PermissionResponse(
              resources: request.resources,
              action: PermissionResponseAction.GRANT,
            );
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            final uri = navigationAction.request.url!;

            if (![
              'http',
              'https',
              'file',
              'chrome',
              'data',
              'javascript',
              'about',
            ].contains(uri.scheme)) {
              if (await urlLauncher.canLaunchUrl(uri)) {
                // Launch the App
                await urlLauncher.launchUrl(
                  uri,
                );
                // and cancel the request
                return NavigationActionPolicy.CANCEL;
              }
            }

            return NavigationActionPolicy.ALLOW;
          },
          onLoadStop: (controller, url) async {
            await pullToRefreshController?.endRefreshing();
          },
          onReceivedError: (controller, request, error) {
            pullToRefreshController?.endRefreshing();
          },
          onProgressChanged: (controller, progress) {
            if (progress == 100) {
              pullToRefreshController?.endRefreshing();
            }
            webViewCurrentProgress.setState(progress);
          },
          onUpdateVisitedHistory: (controller, url, androidIsReload) {
            webViewCurrentUrl.setState(url.toString());
          },
          onConsoleMessage: (controller, consoleMessage) {
            final message = {
              'message': 'WebViewPage#onConsoleMessage',
              'consoleMessage': consoleMessage.toString(),
            }.toString();
            switch (consoleMessage.messageLevel) {
              case ConsoleMessageLevel.DEBUG:
                appLogger.d(message);
              case ConsoleMessageLevel.WARNING:
                appLogger.w(message);
              case ConsoleMessageLevel.ERROR:
                appLogger.e(message);
              default:
                appLogger.i(message);
            }
          },
        ),
        webViewCurrentProgress.state < 100
            ? LinearProgressIndicator(value: webViewCurrentProgress.state / 100)
            : Container(),
      ],
    );
  }

  InAppWebViewSettings _buildWebViewSettings() {
    return InAppWebViewSettings(
      isInspectable: kDebugMode,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllow: 'camera; microphone',
      iframeAllowFullscreen: true,
    );
  }
}

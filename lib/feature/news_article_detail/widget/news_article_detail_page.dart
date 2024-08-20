import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/navigator/hook/use_navigator_state.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_pull_to_refresh_controller.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_webview_can_go_back.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_webview_can_go_back_effect.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_webview_controller.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_webview_request_go_back_effect.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_webview_vertical_scroll.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_webview_vertical_scroll_effect.dart';
import 'package:flutter_news_sample/feature/share/hook/use_share_wrapper.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:flutter_news_sample/feature/url_launcher/hook/use_url_launcher_wrapper.dart';
import 'package:flutter_news_sample/widget/body_container.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

class NewsArticleDetailPage extends HookConsumerWidget {
  const NewsArticleDetailPage({
    super.key,
    required this.title,
    required this.url,
  });

  static const routeName = 'NewsArticleDetailPage';
  static const routeNameForSearch = 'NewsArticleSearchDetailPage';

  final String title;
  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLogger = useAppLogger();
    final translations = useTranslations();
    final navigatorState = useNavigatorState();
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );
    final webViewVerticalScroll = useWebviewVerticalScroll();
    final GlobalKey webViewKey = useMemoized(GlobalKey.new);
    final webViewController = useWebViewController();
    final webViewSettings = useMemoized(buildWebViewSettings);
    final pullToRefreshController = useMemoized(
      () => usePullToRefreshController(webViewController: webViewController),
    );
    final canGoBack = useWebViewCanGoBack();
    final urlLauncherWrapper = useUrlLauncherWrapper();
    final shareWrapper = useShareWrapper();
    final currentUrl = useState(url);
    final currentProgress = useState(0);

    useWebViewCanGoBackEffect(
      webViewController: webViewController,
      setCanGoBack: canGoBack.setState,
    );
    useWebViewRequestGoBackEffect(
      webViewController: webViewController,
    );
    useWebviewVerticalScrollEffect(
      animationController: animationController,
    );
    useEffect(
      () {
        Future.delayed(Duration.zero, () {
          if (webViewVerticalScroll.state.direction ==
              WebviewVerticalScrollDirection.up) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
        });
        return () {};
      },
      [webViewVerticalScroll.state.direction],
    );

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }

        if (canGoBack.state) {
          webViewController.value?.goBack();
        } else if (navigatorState.canPop()) {
          navigatorState.pop();
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BodyContainer(
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Column(
                  children: [
                    ClipRect(
                      child: Transform.translate(
                        offset: Offset(
                          0,
                          -kToolbarHeight * animationController.value,
                        ),
                        child: SizedBox(
                          height:
                              (-kToolbarHeight * animationController.value) +
                                  kToolbarHeight,
                          child: _appBar(
                            context,
                            ref,
                            navigatorState: navigatorState,
                            translations: translations,
                            webViewController: webViewController,
                            currentUrl: currentUrl,
                            shareWrapper: shareWrapper,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: _body(
                        context,
                        ref,
                        appLogger: appLogger,
                        webViewVerticalScroll: webViewVerticalScroll,
                        webViewKey: webViewKey,
                        webViewController: webViewController,
                        webViewSettings: webViewSettings,
                        pullToRefreshController: pullToRefreshController,
                        currentUrl: currentUrl,
                        currentProgress: currentProgress,
                        urlLauncherWrapper: urlLauncherWrapper,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar(
    BuildContext context,
    WidgetRef ref, {
    required NavigatorState navigatorState,
    required Translations translations,
    required ObjectRef<InAppWebViewController?> webViewController,
    required UseShareWrapperReturn shareWrapper,
    required ValueNotifier<String> currentUrl,
  }) {
    final leading = FutureBuilder(
      future: webViewController.value?.canGoBack(),
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          return IconButton(
            icon: Icon(
              defaultTargetPlatform == TargetPlatform.iOS
                  ? Icons.arrow_back_ios
                  : Icons.arrow_back,
            ),
            onPressed: () async {
              if (await webViewController.value?.canGoBack() ?? false) {
                await webViewController.value?.goBack();
              } else {
                if (context.mounted) {
                  navigatorState.pop();
                }
              }
            },
          );
        } else {
          if (context.canPop()) {
            return IconButton(
              icon: Icon(
                defaultTargetPlatform == TargetPlatform.iOS
                    ? Icons.arrow_back_ios
                    : Icons.arrow_back,
              ),
              tooltip: translations.general.back,
              onPressed: () {
                if (context.mounted) {
                  navigatorState.pop();
                }
              },
            );
          }

          return Container();
        }
      },
    );

    return AppBar(
      title: Text(title),
      leading: leading,
      actions: [
        IconButton(
          icon: const Icon(Icons.share),
          tooltip: translations.general.share,
          onPressed: () async {
            await shareWrapper.share(currentUrl.value);
          },
        ),
      ],
    );
  }

  Widget _body(
    BuildContext context,
    WidgetRef ref, {
    required Logger appLogger,
    required UseWebviewVerticalScrollReturn webViewVerticalScroll,
    required Key webViewKey,
    required ObjectRef<InAppWebViewController?> webViewController,
    required PullToRefreshController? pullToRefreshController,
    required InAppWebViewSettings webViewSettings,
    required ValueNotifier<String> currentUrl,
    required ValueNotifier<int> currentProgress,
    required UseUrlLauncherWrapperReturn urlLauncherWrapper,
  }) {
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
            currentUrl.value = url.toString();
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
              if (await urlLauncherWrapper.canLaunchUrl(uri)) {
                // Launch the App
                await urlLauncherWrapper.launchUrl(
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
            currentProgress.value = progress;
          },
          onUpdateVisitedHistory: (controller, url, androidIsReload) {
            currentUrl.value = url.toString();
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
        currentProgress.value < 100
            ? LinearProgressIndicator(value: currentProgress.value / 100)
            : Container(),
      ],
    );
  }

  InAppWebViewSettings buildWebViewSettings() {
    return InAppWebViewSettings(
      isInspectable: kDebugMode,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllow: 'camera; microphone',
      iframeAllowFullscreen: true,
    );
  }
}

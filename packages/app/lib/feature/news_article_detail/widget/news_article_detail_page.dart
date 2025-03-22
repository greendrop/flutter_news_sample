import 'package:app/feature/localization/hook/use_l10n.dart';
import 'package:app/feature/navigator/hook/use_navigator_state.dart';
import 'package:app/feature/news_article_detail/hook/use_webview_can_go_back.dart';
import 'package:app/feature/news_article_detail/hook/use_webview_current_url.dart';
import 'package:app/feature/news_article_detail/hook/use_webview_request_go_back.dart';
import 'package:app/feature/news_article_detail/hook/use_webview_vertical_scroll_effect.dart';
import 'package:app/feature/news_article_detail/widget/news_article_detail_webview.dart';
import 'package:app/feature/share/hook/use_share.dart';
import 'package:app/widget/body_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsArticleDetailPage extends HookConsumerWidget {
  const NewsArticleDetailPage({
    super.key,
    required this.title,
    required this.url,
    this.isDummyWebView = false,
    this.useShare = useShareImpl,
  });

  final String title;
  final String url;
  final bool isDummyWebView;
  final UseShare useShare;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final navigatorState = useNavigatorState();
    final appBarAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );
    final webViewCurrentUrl = useWebViewCurrentUrl();
    final webViewCanGoBack = useWebViewCanGoBack();
    final webViewRequestGoBack = useWebViewRequestGoBack();
    final share = useShare();

    useWebviewVerticalScrollEffect(
      appBarAnimationController: appBarAnimationController,
    );

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }

        if (webViewCanGoBack.state) {
          webViewRequestGoBack.setState(true);
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
              animation: appBarAnimationController,
              builder: (context, child) {
                return Column(
                  children: [
                    ClipRect(
                      child: Transform.translate(
                        offset: Offset(
                          0,
                          -kToolbarHeight * appBarAnimationController.value,
                        ),
                        child: SizedBox(
                          height: (-kToolbarHeight *
                                  appBarAnimationController.value) +
                              kToolbarHeight,
                          child: _appBar(
                            context,
                            ref,
                            navigatorState: navigatorState,
                            l10n: l10n,
                            webViewCurrentUrl: webViewCurrentUrl,
                            webViewCanGoBack: webViewCanGoBack,
                            webViewRequestGoBack: webViewRequestGoBack,
                            share: share,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: NewsArticleDetailWebView(
                        url: url,
                        isDummyWebView: isDummyWebView,
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
    required L10n l10n,
    required UseWebViewCurrentUrlReturn webViewCurrentUrl,
    required UseWebViewCanGoBackReturn webViewCanGoBack,
    required UseWebViewRequestGoBackReturn webViewRequestGoBack,
    required UseShareReturn share,
  }) {
    late Widget leading;
    if (webViewCanGoBack.state) {
      leading = IconButton(
        icon: Icon(
          defaultTargetPlatform == TargetPlatform.iOS
              ? Icons.arrow_back_ios
              : Icons.arrow_back,
        ),
        onPressed: () {
          webViewRequestGoBack.setState(true);
        },
      );
    } else {
      if (navigatorState.canPop()) {
        leading = IconButton(
          icon: Icon(
            defaultTargetPlatform == TargetPlatform.iOS
                ? Icons.arrow_back_ios
                : Icons.arrow_back,
          ),
          tooltip: l10n.generalBack,
          onPressed: () {
            if (context.mounted) {
              navigatorState.pop();
            }
          },
        );
      } else {
        leading = Container();
      }
    }

    return AppBar(
      title: Text(title),
      leading: leading,
      actions: [
        IconButton(
          icon: const Icon(Icons.share),
          tooltip: l10n.generalShare,
          onPressed: () async {
            await share.run(webViewCurrentUrl.state);
          },
        ),
      ],
    );
  }
}

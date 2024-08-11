import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/news_article_detail/entity/webview_vertical_scroll_state.dart';
import 'package:flutter_news_sample/feature/news_article_detail/riverpod/webview_vertical_scroll_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

export 'package:flutter_news_sample/feature/news_article_detail/entity/webview_vertical_scroll_state.dart';

typedef UseWebviewVerticalScrollReturn = ({
  WebViewVerticalScrollState state,
  void Function(int position) updatePosition,
});

typedef UseWebviewVerticalScroll = UseWebviewVerticalScrollReturn Function();

const String _hookName = 'useWebviewVerticalScroll';

UseWebviewVerticalScrollReturn useWebviewVerticalScroll() {
  final context = useContext();
  final ref = context as WidgetRef;
  final appLogger = useAppLogger();

  final state = ref.watch(webViewVerticalScrollStateNotifierProvider);

  final updatePosition = useCallback(
    (int position) {
      appLogger.i([
        '$_hookName#updatePosition',
      ]);
      return ref
          .read(webViewVerticalScrollStateNotifierProvider.notifier)
          .updatePosition(position);
    },
  );

  return (state: state, updatePosition: updatePosition);
}

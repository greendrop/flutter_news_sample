import 'package:flutter_news_sample/feature/news_article_detail/entity/webview_vertical_scroll_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'webview_vertical_scroll_state_notifier.g.dart';

@riverpod
class WebViewVerticalScrollStateNotifier
    extends _$WebViewVerticalScrollStateNotifier {
  @override
  WebViewVerticalScrollState build() {
    return WebViewVerticalScrollState();
  }

  void updatePosition(int position) {
    if (position < 0) {
      return;
    }

    final beforePosition = state.position;
    final beforeValue = state.value;
    final beforeDirection = state.direction;
    var value = position - beforePosition;
    if (value.abs() <= 1) {
      return;
    }
    final direction = value > 0
        ? WebviewVerticalScrollDirection.down
        : WebviewVerticalScrollDirection.up;
    if (beforeDirection == direction) {
      value += beforeValue;
    }

    state = state.copyWith(
      direction: direction,
      value: value,
      position: position,
    );
  }
}

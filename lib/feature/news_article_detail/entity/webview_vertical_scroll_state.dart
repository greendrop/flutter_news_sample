import 'package:freezed_annotation/freezed_annotation.dart';

part 'webview_vertical_scroll_state.freezed.dart';

@freezed
class WebViewVerticalScrollState with _$WebViewVerticalScrollState {
  factory WebViewVerticalScrollState({
    @Default(WebviewVerticalScrollDirection.up)
    WebviewVerticalScrollDirection direction,
    @Default(0) int value,
    @Default(0) int position,
  }) = _WebViewVerticalScrollState;
  const WebViewVerticalScrollState._();
}

enum WebviewVerticalScrollDirection {
  up,
  down,
}

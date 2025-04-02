import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'webview_current_url_notifier.g.dart';

@riverpod
class WebViewCurrentUrlNotifier extends _$WebViewCurrentUrlNotifier {
  @override
  String build() {
    return '';
  }

  Future<void> setState(String value) async {
    state = value;
  }
}

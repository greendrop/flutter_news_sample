import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'webview_can_go_back_notifier.g.dart';

@riverpod
class WebViewCanGoBackNotifier extends _$WebViewCanGoBackNotifier {
  @override
  bool build() {
    return false;
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> setState(bool value) async {
    state = value;
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'webview_current_progress_notifier.g.dart';

@riverpod
class WebViewCurrentProgressNotifier extends _$WebViewCurrentProgressNotifier {
  @override
  int build() {
    return 0;
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> setState(int value) async {
    state = value;
  }
}

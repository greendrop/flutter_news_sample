import 'dart:async';

import 'package:flutter_news_sample/feature/app_log_detail/riverpod/app_logger_file.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_logger_file_content_notifier.g.dart';

@riverpod
class AppLoggerFileContentNotifier extends _$AppLoggerFileContentNotifier {
  @override
  FutureOr<String> build({required String filename}) => '';

  Future<void> fetch() {
    state = const AsyncValue<String>.loading().copyWithPrevious(state);

    final file = ref.watch(appLoggerFileProvider(filename: filename));

    if (file == null) {
      state = const AsyncValue.data('');
      return Future.value();
    }

    return file.readAsString().then((value) {
      state = AsyncValue.data(value);
    });
  }
}

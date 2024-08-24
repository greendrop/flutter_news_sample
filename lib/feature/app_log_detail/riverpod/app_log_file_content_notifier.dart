import 'dart:async';

import 'package:flutter_news_sample/feature/app_log_detail/riverpod/app_log_file_repository.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger_directory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_log_file_content_notifier.g.dart';

@riverpod
class AppLogFileContentNotifier extends _$AppLogFileContentNotifier {
  @override
  FutureOr<String> build({required String filename}) => '';

  Future<void> fetch() async {
    state = const AsyncValue<String>.loading().copyWithPrevious(state);

    final directory = ref.read(appLoggerDirectoryProvider);
    if (directory == null) {
      state = const AsyncValue.data('');
      return Future.value();
    }

    final file = await ref
        .read(appLogFileRepositoryProvider)
        .fetch(directory: directory, filename: filename);

    if (file == null) {
      state = const AsyncValue.data('');
      return Future.value();
    }

    await file.readAsString().then((value) {
      state = AsyncValue.data(value);
    });

    return Future.value();
  }
}

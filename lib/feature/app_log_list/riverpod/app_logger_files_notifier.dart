import 'dart:io';

import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger_directory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_logger_files_notifier.g.dart';

@riverpod
class AppLoggerFilesNotifier extends _$AppLoggerFilesNotifier {
  @override
  FutureOr<List<FileSystemEntity>> build() => [];

  Future<void> fetch() {
    state = const AsyncValue<List<FileSystemEntity>>.loading()
        .copyWithPrevious(state);

    final directory = ref.watch(appLoggerDirectoryProvider);

    if (directory == null) {
      state = const AsyncValue.data([]);
      return Future.value();
    }

    return directory.list().toList().then((value) {
      state = AsyncValue.data(value);
    });
  }
}

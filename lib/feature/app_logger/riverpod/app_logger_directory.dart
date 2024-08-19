import 'dart:io';

import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger_directory_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_logger_directory.g.dart';

@Riverpod(keepAlive: true)
class AppLoggerDirectory extends _$AppLoggerDirectory {
  @override
  Directory? build() => null;

  Future<void> initialize() async {
    state = await ref.read(appLoggerDirectoryRepositoryProvider).fetch();
  }
}

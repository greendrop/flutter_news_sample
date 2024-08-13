import 'dart:io';

import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger_directory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_logger_file.g.dart';

@riverpod
File? appLoggerFile(AppLoggerFileRef ref, {required String filename}) {
  final directory = ref.watch(appLoggerDirectoryProvider);

  if (directory == null) {
    return null;
  }

  return File(directory.path + Platform.pathSeparator + filename);
}

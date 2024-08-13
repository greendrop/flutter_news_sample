import 'dart:io';

import 'package:flutter_news_sample/config/app_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_logger_directory.g.dart';

@Riverpod(keepAlive: true)
class AppLoggerDirectory extends _$AppLoggerDirectory {
  @override
  Directory? build() => null;

  Future<void> initialize() async {
    final appDocumentsDir = await getApplicationDocumentsDirectory();
    state = Directory(
      appDocumentsDir.path +
          Directory.systemTemp.path +
          Platform.pathSeparator +
          AppConfig.instance.appLogPathSuffix,
    );
  }
}

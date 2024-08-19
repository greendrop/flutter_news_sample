import 'dart:io';

import 'package:flutter_news_sample/config/app_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

class AppLoggerDirectoryRepository {
  AppLoggerDirectoryRepository({required this.ref});

  final Ref ref;

  Future<Directory> fetch() async {
    final appDocumentsDir = await getApplicationDocumentsDirectory();
    return Directory(
      appDocumentsDir.path +
          Directory.systemTemp.path +
          Platform.pathSeparator +
          AppConfig.instance.appLogPathSuffix,
    );
  }
}

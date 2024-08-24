import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppLogFileRepository {
  AppLogFileRepository({required this.ref});

  final Ref ref;

  Future<File?> fetch({
    required Directory directory,
    required String filename,
  }) async {
    final file = File(directory.path + Platform.pathSeparator + filename);
    if (file.existsSync()) {
      return null;
    }
    return file;
  }
}

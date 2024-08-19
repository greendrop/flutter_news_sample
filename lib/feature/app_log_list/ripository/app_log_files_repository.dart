import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppLogFilesRepository {
  AppLogFilesRepository({required this.ref});

  final Ref ref;

  Future<List<FileSystemEntity>> fetch({required Directory directory}) async {
    return directory.list().toList();
  }
}

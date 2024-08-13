import 'dart:io';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_log_list/riverpod/app_logger_files_notifier.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UseAppLoggerFilesReturn = ({
  AsyncValue<List<FileSystemEntity>> state,
  Future<void> Function() fetch,
});

typedef UseAppLoggerFiles = UseAppLoggerFilesReturn Function();

const String _hookName = 'useAppLoggerFiles';

UseAppLoggerFilesReturn useAppLoggerFiles() {
  final context = useContext();
  final ref = context as WidgetRef;

  final state = ref.watch(appLoggerFilesNotifierProvider);

  final fetch = useCallback(
    () {
      ref.read(appLoggerProvider).i(['$_hookName#fetch']);
      return ref.read(appLoggerFilesNotifierProvider.notifier).fetch();
    },
    [state],
  );

  return (
    state: state,
    fetch: fetch,
  );
}

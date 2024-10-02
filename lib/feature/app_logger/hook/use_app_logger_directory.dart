import 'dart:io';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger_directory.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UseAppLoggerDirectoryReturn = ({
  Directory? state,
  Future<void> Function() initialize,
});

typedef UseAppLoggerDirectory = UseAppLoggerDirectoryReturn Function();

UseAppLoggerDirectoryReturn useAppLoggerDirectoryImpl() {
  final context = useContext();
  final ref = context as WidgetRef;

  final state = ref.watch(appLoggerDirectoryProvider);

  final initialize = useCallback(
    () {
      return ref.read(appLoggerDirectoryProvider.notifier).initialize();
    },
    [],
  );

  return (
    state: state,
    initialize: initialize,
  );
}

final UseAppLoggerDirectory useAppLoggerDirectory = useAppLoggerDirectoryImpl;

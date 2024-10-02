import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

typedef UseAppLogger = Logger Function();

Logger useAppLoggerImpl() {
  return (useContext() as WidgetRef).watch(appLoggerProvider);
}

final useAppLogger = useAppLoggerImpl;

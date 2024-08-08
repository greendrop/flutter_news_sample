import 'package:flutter_news_sample/feature/app_logger/printer/json_fmt_printer.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger_directory.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_logger.g.dart';

@Riverpod(keepAlive: true)
Logger appLogger(AppLoggerRef ref) {
  final logDirectory = ref.watch(appLoggerDirectoryProvider);
  return Logger(
    printer: JsonFmtPrinter(),
    output: MultiOutput(
      [
        ConsoleOutput(),
        AdvancedFileOutput(
          path: logDirectory!.path,
          maxRotatedFilesCount: 8,
        ),
      ],
    ),
  );
}

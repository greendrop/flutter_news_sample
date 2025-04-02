import 'package:app/config/app_config.dart';
import 'package:app/feature/app_logger/printer/json_fmt_printer.dart';
import 'package:app/feature/app_logger/riverpod/app_logger_directory.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_logger.g.dart';

@Riverpod(keepAlive: true)
Logger appLogger(Ref ref) {
  final logDirectory = ref.watch(appLoggerDirectoryProvider);
  return Logger(
    printer: JsonFmtPrinter(),
    output: MultiOutput(
      [
        if (AppConfig.instance.appLogConsoleEnabled) ConsoleOutput() else null,
        if (logDirectory != null)
          AdvancedFileOutput(path: logDirectory.path, maxRotatedFilesCount: 8)
        else
          null,
      ].nonNulls.toList(),
    ),
  );
}

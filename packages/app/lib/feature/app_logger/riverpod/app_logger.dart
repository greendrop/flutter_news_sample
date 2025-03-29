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
        AppConfig.instance.appLogConsoleEnabled ? ConsoleOutput() : null,
        logDirectory != null
            ? AdvancedFileOutput(
              path: logDirectory.path,
              maxRotatedFilesCount: 8,
            )
            : null,
      ].nonNulls.toList(),
    ),
  );
}

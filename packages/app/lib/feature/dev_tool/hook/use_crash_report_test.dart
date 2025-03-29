import 'package:app/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef UseCrashReportTestReturn = ({Future<void> Function() run});

typedef UseCrashReportTest = UseCrashReportTestReturn Function();

const String _hookName = 'useCrashReportTest';

UseCrashReportTestReturn useCrashReportTestImpl() {
  final appLogger = useAppLogger();

  final run = useCallback(() {
    appLogger.i(['$_hookName#run']);
    throw Exception('Crash Report Test');
  });

  return (run: run);
}

const UseCrashReportTest useCrashReportTest = useCrashReportTestImpl;

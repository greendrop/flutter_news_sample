import 'dart:io';

class AppConfig {
  factory AppConfig() => instance;
  AppConfig._internal() {
    flavor = const String.fromEnvironment('flavor');
    showDevTool = Platform.environment['SHOW_DEV_TOOL'] == 'true' ||
        const bool.fromEnvironment('showDevTool');
    crashReportEnabled = const bool.fromEnvironment('crashReportEnabled');
    appLogConsoleEnabled =
        const bool.fromEnvironment('appLogConsoleEnabled', defaultValue: true);
    newsApiBaseUrl = const String.fromEnvironment('newsApiBaseUrl');
    newsApiKey = const String.fromEnvironment('newsApiKey');

    switch (flavor) {
      case 'prod':
        break;
    }
  }

  static final AppConfig instance = AppConfig._internal();

  String flavor = '';
  bool showDevTool = false;
  bool crashReportEnabled = false;
  bool appLogConsoleEnabled = true;
  String appLogPathSuffix = 'app_log';
  String newsApiBaseUrl = '';
  String newsApiKey = '';
}

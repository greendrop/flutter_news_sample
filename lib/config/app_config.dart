import 'dart:io';

class AppConfig {
  factory AppConfig() => instance;
  AppConfig._internal() {
    flavor = const String.fromEnvironment('flavor');
    showDevTool = Platform.environment['SHOW_DEV_TOOL'] == 'true' ||
        const bool.fromEnvironment('showDevTool');
    crashReportEnabled = const bool.fromEnvironment('crashReportEnabled');
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
  String appLogPathSuffix = 'app_log';
  String newsApiKey = '';
}

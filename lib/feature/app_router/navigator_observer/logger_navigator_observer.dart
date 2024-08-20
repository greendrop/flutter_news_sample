import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoggerNavigatorObserver extends NavigatorObserver {
  LoggerNavigatorObserver({required this.logger});

  final Logger logger;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    logger.i(
      [
        'Navigator didPush',
        {
          'settingsName': route.settings.name,
          'settingsArguments': route.settings.arguments.toString(),
        }
      ],
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    logger.i(
      [
        'Navigator didPop',
        {
          'settingsName': route.settings.name,
          'settingsArguments': route.settings.arguments.toString(),
        }
      ],
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    logger.i(
      [
        'Navigator didRemove',
        {
          'settingsName': route.settings.name,
          'settingsArguments': route.settings.arguments.toString(),
        }
      ],
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    logger.i(
      [
        'Navigator didReplace',
        {
          'settingsName': newRoute?.settings.name,
          'settingsArguments': newRoute?.settings.arguments.toString(),
        }
      ],
    );
  }
}

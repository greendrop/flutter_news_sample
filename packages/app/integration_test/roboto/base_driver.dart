import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

abstract class BaseDriver {
  BaseDriver(this.tester);

  final WidgetTester tester;

  Future<void> waitFor(Finder finder, {int timeoutSecondes = 10}) async {
    try {
      await waitUntile(
        () => finder.evaluate().isNotEmpty,
        timeoutSecondes: timeoutSecondes,
      );
    } on Exception catch (_) {
      throw TimeoutException(
        'waitFor timeout',
        Duration(seconds: timeoutSecondes),
      );
    }
  }

  Future<void> waitUntile(
    bool Function() condition, {
    int timeoutSecondes = 10,
  }) async {
    for (var i = 0; i < timeoutSecondes; i++) {
      if (condition()) {
        return;
      }
      await tester.pump(const Duration(seconds: 1));
    }

    throw TimeoutException(
      'waitUntile timeout',
      Duration(seconds: timeoutSecondes),
    );
  }
}

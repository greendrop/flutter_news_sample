import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_workspace/feature/dev_tool/dev_tool_page.dart';

import '../../support/alchemist/golden_test_device_scenario.dart';
import '../../support/widget/test_material_app.dart';

void main() {
  group('DevToolPage Golden Test', () {
    final fileNamePrefix = 'dev_tool_page${Platform.pathSeparator}';
    final devices = Device.all;

    group('Default', () {
      goldenTest(
        '正しくレンダリングされること',
        fileName: '${fileNamePrefix}default',
        builder: () {
          final children = <Widget>[];
          for (final device in devices) {
            children.add(
              GoldenTestDeviceScenario(
                name: device.name,
                device: device,
                builder: (context) {
                  return TestMaterialApp(
                    child: buildAppLogListPageDefault(context),
                  );
                },
              ),
            );
          }
          return GoldenTestGroup(columns: devices.length, children: children);
        },
      );
    });
  });
}

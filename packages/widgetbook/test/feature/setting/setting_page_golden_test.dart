import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_workspace/feature/setting/setting_page.dart';

import '../../support/alchemist/golden_test_device_scenario.dart';
import '../../support/widget/test_material_app.dart';

void main() {
  group('SettingPage Golden Test', () {
    final fileNamePrefix = 'setting_page${Platform.pathSeparator}';
    final devices = Device.all;

    group('Default', () {
      final children = <Widget>[];
      for (final device in devices) {
        children.add(
          GoldenTestDeviceScenario(
            name: device.name,
            device: device,
            builder: (context) {
              return TestMaterialApp(child: buildSettingDefault(context));
            },
          ),
        );
      }

      goldenTest(
        '正しくレンダリングされること',
        fileName: '${fileNamePrefix}default',
        builder: () {
          return GoldenTestGroup(columns: devices.length, children: children);
        },
      );
    });

    group('Default With Dev Tool', () {
      final children = <Widget>[];
      for (final device in devices) {
        children.add(
          GoldenTestDeviceScenario(
            name: device.name,
            device: device,
            builder: (context) {
              return TestMaterialApp(
                child: buildSettingDefaultWithDevTool(context),
              );
            },
          ),
        );
      }

      goldenTest(
        'Dev Tool 表示時に正しくレンダリングされること',
        fileName: '${fileNamePrefix}default_with_dev_tool',
        builder: () {
          return GoldenTestGroup(columns: devices.length, children: children);
        },
      );
    });
  });
}

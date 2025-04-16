import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_workspace/feature/app_log_list/app_log_list_page.dart';

import '../../support/alchemist/golden_test_device_scenario.dart';
import '../../support/widget/test_material_app.dart';

void main() {
  group('AppLogListPage Golden Test', () {
    final fileNamePrefix = 'app_log_list_page${Platform.pathSeparator}';
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

    group('Empty', () {
      goldenTest(
        '正しくレンダリングされること',
        fileName: '${fileNamePrefix}empty',
        builder: () {
          final children = <Widget>[];
          for (final device in devices) {
            children.add(
              GoldenTestDeviceScenario(
                name: device.name,
                device: device,
                builder: (context) {
                  return TestMaterialApp(
                    child: buildAppLogListPageEmpty(context),
                  );
                },
              ),
            );
          }
          return GoldenTestGroup(columns: devices.length, children: children);
        },
      );
    });

    group('Loading', () {
      goldenTest(
        '正しくレンダリングされること',
        fileName: '${fileNamePrefix}loading',
        builder: () {
          final children = <Widget>[];
          for (final device in devices) {
            children.add(
              GoldenTestDeviceScenario(
                name: device.name,
                device: device,
                builder: (context) {
                  return TestMaterialApp(
                    child: buildAppLogListPageLoading(
                      context,
                      stopLoadingIndicator: true,
                    ),
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

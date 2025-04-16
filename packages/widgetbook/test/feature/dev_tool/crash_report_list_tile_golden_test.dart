import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_workspace/feature/dev_tool/crash_report_test_list_tile.dart';

import '../../support/alchemist/golden_test_widget_scenario.dart';
import '../../support/widget/test_material_app.dart';

void main() {
  group('CrashReportListTile Golden Test', () {
    final fileNamePrefix = 'crash_report_list_tile${Platform.pathSeparator}';
    const brightnesses = Brightness.values;

    group('Enabled', () {
      goldenTest(
        '正しくレンダリングされること',
        fileName: '${fileNamePrefix}enabled',
        builder: () {
          final children = <Widget>[];
          for (final brightness in brightnesses) {
            children.add(
              GoldenTestWidgetScenario(
                name: brightness.name,
                brightness: brightness,
                builder: (context) {
                  return TestMaterialApp(
                    child: buildCrashReportListTileEnabled(context),
                  );
                },
              ),
            );
          }
          return GoldenTestGroup(
            columns: brightnesses.length,
            children: children,
          );
        },
      );
    });

    group('Disabled', () {
      goldenTest(
        '正しくレンダリングされること',
        fileName: '${fileNamePrefix}disabled',
        builder: () {
          final children = <Widget>[];
          for (final brightness in brightnesses) {
            children.add(
              GoldenTestWidgetScenario(
                name: brightness.name,
                brightness: brightness,
                builder: (context) {
                  return TestMaterialApp(
                    child: buildCrashReportListTileDisabled(context),
                  );
                },
              ),
            );
          }
          return GoldenTestGroup(
            columns: brightnesses.length,
            children: children,
          );
        },
      );
    });
  });
}

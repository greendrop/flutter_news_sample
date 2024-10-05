import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/setting/widget/dev_tool_list_tile.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_widget_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('DevToolListTile Golden Test', () {
    prepareGoldenFileComparatorWithThreshold();

    Widget buildDevToolListTile({VoidCallback? onTap}) {
      return TestMaterialApp(
        child: DevToolListTile(onTap: onTap),
      );
    }

    final fileNamePrefix = 'dev_tool_list_tile${Platform.pathSeparator}';

    for (final brightness in Brightness.values) {
      goldenTest(
        'Enabled ${brightness.name}',
        fileName: '${fileNamePrefix}enabled_${brightness.name}',
        builder: () {
          return GoldenTestWidgetScenario(
            name: '',
            brightness: brightness,
            builder: () => buildDevToolListTile(onTap: () {}),
          );
        },
      );

      goldenTest(
        'Disabled ${brightness.name}',
        fileName: '${fileNamePrefix}disabled_${brightness.name}',
        builder: () {
          return GoldenTestWidgetScenario(
            name: '',
            brightness: brightness,
            builder: buildDevToolListTile,
          );
        },
      );
    }
  });
}

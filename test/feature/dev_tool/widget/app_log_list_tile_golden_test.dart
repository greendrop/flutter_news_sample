import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/app_log_list_tile.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_widget_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('AppLogListTile Golden Test', () {
    prepareGoldenFileComparatorWithThreshold();

    Widget buildAppLogListTile({VoidCallback? onTap}) {
      return TestMaterialApp(
        child: AppLogListTile(
          onTap: onTap,
        ),
      );
    }

    for (final brightness in Brightness.values) {
      group(brightness.name, () {
        group('Enabled', () {
          goldenTest(
            '',
            fileName: 'app_log_list_tile_enabled_${brightness.name}',
            builder: () {
              return GoldenTestWidgetScenario(
                name: '',
                brightness: brightness,
                builder: () => buildAppLogListTile(onTap: () {}),
              );
            },
          );
        });

        group('Disabled', () {
          goldenTest(
            '',
            fileName: 'app_log_list_tile_disabled_${brightness.name}',
            builder: () {
              return GoldenTestWidgetScenario(
                name: '',
                brightness: brightness,
                builder: buildAppLogListTile,
              );
            },
          );
        });
      });
    }
  });
}

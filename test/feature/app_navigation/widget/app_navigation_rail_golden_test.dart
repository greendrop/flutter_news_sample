import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_navigation/widget/app_navigation_rail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_widget_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('AppNavigationRail Golden Test', () {
    prepareGoldenFileComparatorWithThreshold(threshold: 0.02);

    Widget buildAppNavigationRail({int selectedIndex = 0}) {
      return TestMaterialApp(
        child: AppNavigationRail(
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {},
        ),
      );
    }

    for (final brightness in Brightness.values) {
      group(brightness.name, () {
        goldenTest(
          '',
          fileName: 'app_navigation_rail_${brightness.name}',
          builder: () {
            return GoldenTestWidgetScenario(
              name: '',
              brightness: brightness,
              builder: buildAppNavigationRail,
            );
          },
        );
      });
    }
  });
}

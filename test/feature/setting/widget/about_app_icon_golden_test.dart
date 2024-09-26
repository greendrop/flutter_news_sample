import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/setting/widget/about_app_icon.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_widget_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('AboutAppIcon Golden Test', () {
    prepareGoldenFileComparatorWithThreshold();

    Widget buildAboutAppIcon() {
      return const TestMaterialApp(
        child: AboutAppIcon(),
      );
    }

    for (final brightness in Brightness.values) {
      goldenTest(
        'Default',
        fileName: 'about_app_icon_default_${brightness.name}',
        builder: () {
          return GoldenTestWidgetScenario(
            name: '',
            maxWidth: 100,
            maxHeight: 100,
            brightness: brightness,
            builder: buildAboutAppIcon,
          );
        },
      );
    }
  });
}

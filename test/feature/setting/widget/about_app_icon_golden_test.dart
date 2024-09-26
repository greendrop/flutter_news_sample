import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/setting/widget/about_app_icon.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_widget_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';
import '../../../support/widget/test_translation_provider.dart';

void main() {
  group('AboutAppIcon Golden Test', () {
    prepareGoldenFileComparatorWithThreshold(threshold: 0.01);

    Widget buildAboutAppIcon() {
      return const TestMaterialApp(
        withTranslationProvider: false,
        child: AboutAppIcon(),
      );
    }

    goldenTest(
      'Default',
      fileName: 'about_app_icon_default',
      builder: () {
        return TestTranslationProvider(
          builder: (context) {
            final children = <Widget>[];
            for (final brightness in Brightness.values) {
              children.add(
                GoldenTestWidgetScenario(
                  name: '',
                  brightness: brightness,
                  builder: buildAboutAppIcon,
                ),
              );
            }

            return GoldenTestGroup(
              columns: Brightness.values.length,
              children: children,
            );
          },
        );
      },
    );
  });
}

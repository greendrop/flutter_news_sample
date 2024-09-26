import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/setting/widget/app_about_list_tile.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_widget_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';
import '../../../support/widget/test_translation_provider.dart';

void main() {
  group('AppAboutListTile Golden Test', () {
    prepareGoldenFileComparatorWithThreshold(threshold: 0.01);

    Widget buildAppAboutListTile({VoidCallback? onTap}) {
      return TestMaterialApp(
        withTranslationProvider: false,
        child: AppAboutListTile(onTap: onTap),
      );
    }

    goldenTest(
      'Enabled',
      fileName: 'app_about_list_tile_enabled',
      builder: () {
        return TestTranslationProvider(
          builder: (context) {
            final children = <Widget>[];
            for (final brightness in Brightness.values) {
              children.add(
                GoldenTestWidgetScenario(
                  name: '',
                  brightness: brightness,
                  builder: () => buildAppAboutListTile(onTap: () {}),
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

    goldenTest(
      'Disabled',
      fileName: 'app_about_list_tile_disabled',
      builder: () {
        return TestTranslationProvider(
          builder: (context) {
            final children = <Widget>[];
            for (final brightness in Brightness.values) {
              children.add(
                GoldenTestWidgetScenario(
                  name: '',
                  brightness: brightness,
                  builder: buildAppAboutListTile,
                ),
              );
            }

            return GoldenTestGroup(
              columns: 1,
              children: children,
            );
          },
        );
      },
    );
  });
}

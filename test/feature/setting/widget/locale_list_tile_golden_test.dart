import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/setting/widget/locale_list_tile.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_widget_scenario.dart';
import '../../../support/widget/test_material_app.dart';
import '../../../support/widget/test_translation_provider.dart';

void main() {
  Widget buildLocaleListTile({VoidCallback? onTap}) {
    return TestMaterialApp(
      withTranslationProvider: false,
      child: LocaleListTile(onTap: onTap),
    );
  }

  group('LocaleListTile Golden Test', () {
    goldenTest(
      'Enabled',
      fileName: 'locale_list_tile_enabled',
      builder: () {
        return TestTranslationProvider(
          builder: (context) {
            final children = <Widget>[];
            for (final brightness in Brightness.values) {
              children.add(
                GoldenTestWidgetScenario(
                  brightness: brightness,
                  name: 'LocaleListTile Enabled',
                  builder: () => buildLocaleListTile(onTap: () {}),
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
      fileName: 'locale_list_tile_disabled',
      builder: () {
        return TestTranslationProvider(
          builder: (context) {
            final children = <Widget>[];
            for (final brightness in Brightness.values) {
              children.add(
                GoldenTestWidgetScenario(
                  brightness: brightness,
                  name: 'LocaleListTile Disabled',
                  builder: buildLocaleListTile,
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

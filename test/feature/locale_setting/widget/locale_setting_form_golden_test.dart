import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/locale_setting/widget/locale_setting_form.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_widget_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('LocaleSettingForm Golden Test', () {
    prepareGoldenFileComparatorWithThreshold();

    Widget buildLocaleSettingForm({
      Locale initialLocale = const Locale('en'),
      void Function(Locale? locale)? onSubmit,
    }) {
      return TestMaterialApp(
        child: LocaleSettingForm(
          initialLocale: initialLocale,
          onSubmit: onSubmit,
        ),
      );
    }

    for (final brightness in Brightness.values) {
      group(brightness.name, () {
        group('Default', () {
          goldenTest(
            '',
            fileName: 'locale_setting_form_${brightness.name}',
            builder: () {
              return GoldenTestWidgetScenario(
                name: '',
                brightness: brightness,
                builder: () => buildLocaleSettingForm(onSubmit: (locale) {}),
              );
            },
          );
        });
      });
    }
  });
}

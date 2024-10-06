import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/theme_setting/widget/theme_setting_form.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_widget_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('ThemeSettingForm Golden Test', () {
    prepareGoldenFileComparatorWithThreshold();

    Widget buildThemeSettingForm({
      ThemeMode initialThemeMode = ThemeMode.system,
      void Function(ThemeMode themeMode)? onSubmit,
    }) {
      return TestMaterialApp(
        child: ThemeSettingForm(
          initialThemeMode: initialThemeMode,
          onSubmit: onSubmit,
        ),
      );
    }

    final fileNamePrefix = 'theme_setting_form${Platform.pathSeparator}';

    for (final brightness in Brightness.values) {
      group(brightness.name, () {
        group('Default', () {
          goldenTest(
            '',
            fileName: '${fileNamePrefix}default_${brightness.name}',
            builder: () {
              return GoldenTestWidgetScenario(
                name: '',
                brightness: brightness,
                builder: () => buildThemeSettingForm(onSubmit: (locale) {}),
              );
            },
          );
        });
      });
    }
  });
}

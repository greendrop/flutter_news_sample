import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/theme_setting/hook/use_theme_mode.dart';
import 'package:flutter_news_sample/feature/theme_setting/widget/theme_setting_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_device_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('ThemeSettingPage Golden Test', () {
    prepareGoldenFileComparatorWithThreshold();

    Widget buildThemeSettingPage() {
      UseThemeModeReturn useThemeMode() {
        const state = ThemeMode.system;
        Future<void> initialize() async {}
        Future<void> update(ThemeMode themeMode) async {}

        return (
          state: state,
          initialize: initialize,
          update: update,
        );
      }

      return TestMaterialApp(
        child: ThemeSettingPage(
          useThemeMode: useThemeMode,
        ),
      );
    }

    final fileNamePrefix = 'theme_setting_page${Platform.pathSeparator}';

    for (final device in Device.all) {
      group(device.name, () {
        group('Default', () {
          goldenTest(
            '',
            fileName: '${fileNamePrefix}default_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: '',
                device: device,
                builder: buildThemeSettingPage,
              );
            },
          );
        });
      });
    }
  });
}

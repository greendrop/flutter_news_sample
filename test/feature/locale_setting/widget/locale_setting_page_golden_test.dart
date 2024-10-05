import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/locale_setting/hook/use_locale.dart';
import 'package:flutter_news_sample/feature/locale_setting/widget/locale_setting_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_device_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('LocaleSettingPage Golden Test', () {
    prepareGoldenFileComparatorWithThreshold();

    Widget buildLocaleSettingPage() {
      UseLocaleReturn useLocale() {
        const state = null;
        Future<void> initialize() async {}
        Future<void> update(Locale? locale) async {}

        return (
          state: state,
          initialize: initialize,
          update: update,
        );
      }

      return TestMaterialApp(
        child: LocaleSettingPage(
          useLocale: useLocale,
        ),
      );
    }

    final fileNamePrefix = 'locale_setting_page${Platform.pathSeparator}';

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
                builder: buildLocaleSettingPage,
              );
            },
          );
        });
      });
    }
  });
}

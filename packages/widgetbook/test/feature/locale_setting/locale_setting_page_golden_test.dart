import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_workspace/feature/locale_setting/locale_setting_page.dart';

import '../../support/alchemist/golden_test_device_scenario.dart';
import '../../support/widget/test_material_app.dart';

void main() {
  group('LocaleSettingPage Golden Test', () {
    final fileNamePrefix = 'locale_setting_page${Platform.pathSeparator}';
    final devices = Device.all;

    for (final device in devices) {
      group(device.name, () {
        group('Default', () {
          goldenTest(
            '正しくレンダリングされること',
            fileName: '${fileNamePrefix}default_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: device.name,
                device: device,
                builder: (context) {
                  return const TestMaterialApp(child: LocaleSettingPage());
                },
              );
            },
          );
        });
      });
    }
  });
}

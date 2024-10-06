import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/not_found/widget/not_found_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_device_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('NotFoundPage Golden Test', () {
    prepareGoldenFileComparatorWithThreshold(threshold: 0.02);

    Widget buildNotFoundPage() {
      return TestMaterialApp(
        child: NotFoundPage(),
      );
    }

    final fileNamePrefix = 'not_found_page${Platform.pathSeparator}';

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
                builder: buildNotFoundPage,
              );
            },
          );
        });
      });
    }
  });
}

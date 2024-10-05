import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_log_list/hook/use_push_app_log_list_page.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/dev_tool_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_device_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('DevToolPage Golden Test', () {
    prepareGoldenFileComparatorWithThreshold();

    Widget buildDevToolPage() {
      UsePushAppLogListPageReturn usePushAppLogListPage() {
        Future<void> run() {
          return Future.value();
        }

        return (run: run);
      }

      return TestMaterialApp(
        child: DevToolPage(
          usePushAppLogListPage: usePushAppLogListPage,
        ),
      );
    }

    for (final device in Device.all) {
      group(device.name, () {
        group('Default', () {
          goldenTest(
            '',
            fileName: 'dev_tool_page_default_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: '',
                device: device,
                builder: buildDevToolPage,
              );
            },
          );
        });
      });
    }
  });
}

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_log_detail/hook/use_app_log_file_content.dart';
import 'package:flutter_news_sample/feature/app_log_detail/widget/app_log_detail_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/alchemist/golden_test_device_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('AppLogDetailPage Golden Test', () {
    prepareGoldenFileComparatorWithThreshold();

    Widget buildAppLogDetailPage({
      bool isLoading = false,
      bool isEmpty = false,
    }) {
      UseAppLogFileContentReturn useAppLogFileContent({
        required String filename,
      }) {
        late AsyncValue<String> state;
        if (isLoading) {
          state = const AsyncValue.loading();
        } else if (isEmpty) {
          state = const AsyncValue.data('');
        } else {
          state = AsyncValue.data(
            List.generate(3, (index) {
              return 'test';
            }).join('\n'),
          );
        }

        Future<void> fetch() async {}

        return (
          state: state,
          fetch: fetch,
        );
      }

      return TestMaterialApp(
        child: AppLogDetailPage(
          filename: 'test1.log',
          useAppLogFileContent: useAppLogFileContent,
          stopLoadingIndicator: isLoading,
        ),
      );
    }

    for (final device in Device.all) {
      group(device.name, () {
        group('Default', () {
          goldenTest(
            '',
            fileName: 'app_log_detail_page_default_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: '',
                device: device,
                builder: buildAppLogDetailPage,
              );
            },
          );
        });

        group('Empty', () {
          goldenTest(
            '',
            fileName: 'app_log_detail_page_empty_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: '',
                device: device,
                builder: () => buildAppLogDetailPage(isEmpty: true),
              );
            },
          );
        });

        group('Loading', () {
          goldenTest(
            '',
            fileName: 'app_log_detail_page_loading_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: '',
                device: device,
                builder: () {
                  return buildAppLogDetailPage(isLoading: true);
                },
              );
            },
          );
        });
      });
    }
  });
}

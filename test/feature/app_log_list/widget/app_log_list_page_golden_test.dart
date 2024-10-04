import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_log_detail/hook/use_push_app_log_detail_page.dart';
import 'package:flutter_news_sample/feature/app_log_list/entity/app_log_file.dart';
import 'package:flutter_news_sample/feature/app_log_list/hook/use_app_log_files.dart';
import 'package:flutter_news_sample/feature/app_log_list/widget/app_log_list_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/alchemist/golden_test_device_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('AppLogListPage Golden Test', () {
    prepareGoldenFileComparatorWithThreshold();

    Widget buildAppLogListPage({
      bool isLoading = false,
      bool isEmpty = false,
    }) {
      UseAppLogFilesReturn useAppLogFiles() {
        late AsyncValue<List<AppLogFile>> state;
        if (isLoading) {
          state = const AsyncValue.loading();
        } else if (isEmpty) {
          state = const AsyncValue.data([]);
        } else {
          state = AsyncValue.data(
            List.generate(3, (index) {
              return AppLogFile(path: 'test.log');
            }),
          );
        }

        Future<void> fetch({bool isRefresh = false}) async {}

        return (
          state: state,
          fetch: fetch,
        );
      }

      UsePushAppLogDetailPageReturn usePushAppLogDetailPage() {
        Future<void> run({required String filename}) {
          return Future.value();
        }

        return (run: run);
      }

      return TestMaterialApp(
        child: AppLogListPage(
          useAppLogFiles: useAppLogFiles,
          usePushAppLogDetailPage: usePushAppLogDetailPage,
          stopLoadingIndicator: isLoading,
        ),
      );
    }

    for (final device in Device.all) {
      group(device.name, () {
        group('Default', () {
          goldenTest(
            '',
            fileName: 'app_log_list_page_default_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: '',
                device: device,
                builder: buildAppLogListPage,
              );
            },
          );
        });

        group('Empty', () {
          goldenTest(
            '',
            fileName: 'app_log_list_page_empty_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: '',
                device: device,
                builder: () => buildAppLogListPage(isEmpty: true),
              );
            },
          );
        });

        group('Loading', () {
          goldenTest(
            '',
            fileName: 'app_log_list_page_loading_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: '',
                device: device,
                builder: () {
                  return buildAppLogListPage(isLoading: true);
                },
              );
            },
          );
        });
      });
    }
  });
}

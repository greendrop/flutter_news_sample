import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_workspace/feature/app_log_detail/app_log_detail_page.dart';

import '../../support/alchemist/golden_test_device_scenario.dart';
import '../../support/widget/test_material_app.dart';

void main() {
  group('AppLogDetailPage Golden Test', () {
    const namePrefix = 'AppLogDetailPage';
    final fileNamePrefix = 'app_log_detail_page${Platform.pathSeparator}';

    for (final device in Device.all) {
      group(device.name, () {
        group('Default', () {
          goldenTest(
            device.name,
            fileName: '${fileNamePrefix}default_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: '$namePrefix / Default / ${device.name}',
                device: device,
                builder: (context) {
                  return TestMaterialApp(
                    child: buildAppLogDetailPageDefaultUseCase(context),
                  );
                },
              );
            },
          );
        });

        group('Empty', () {
          goldenTest(
            device.name,
            fileName: '${fileNamePrefix}empty_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: '$namePrefix / Empty / ${device.name}',
                device: device,
                builder: (context) {
                  return TestMaterialApp(
                    child: buildAppLogDetailPageEmptyUseCase(context),
                  );
                },
              );
            },
          );
        });

        group('Loading', () {
          goldenTest(
            device.name,
            fileName: '${fileNamePrefix}loading_${device.name}',
            builder: () {
              return GoldenTestDeviceScenario(
                name: '$namePrefix / Loading / ${device.name}',
                device: device,
                builder: (context) {
                  return TestMaterialApp(
                    child: buildAppLogDetailPageLoadingUseCase(
                      context,
                      stopLoadingIndicator: true,
                    ),
                  );
                },
              );
            },
          );
        });
      });
    }
  });
}

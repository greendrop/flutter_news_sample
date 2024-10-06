import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article_detail/widget/news_article_detail_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_device_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('NewsArticleDetailPage Golden Test', () {
    prepareGoldenFileComparatorWithThreshold();

    Widget buildNewsArticleDetailPage() {
      return TestMaterialApp(
        child: NewsArticleDetailPage(
          title: 'dummy',
          url: 'https://example.com',
          isDummyWebView: true,
        ),
      );
    }

    final fileNamePrefix =
        'dev_news_article_detail_page${Platform.pathSeparator}';

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
                builder: buildNewsArticleDetailPage,
              );
            },
          );
        });
      });
    }
  });
}

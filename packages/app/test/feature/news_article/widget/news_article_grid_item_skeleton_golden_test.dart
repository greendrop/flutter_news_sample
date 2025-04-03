import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:app/feature/news_article/widget/news_article_grid_item_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_widget_scenario.dart';
import '../../../support/golden_test/prepare_golden_file_comparator_with_threshold.dart';
import '../../../support/widget/test_material_app.dart';

void main() {
  group('NewsArticleGridItemSkeleton Golden Test', () {
    prepareGoldenFileComparatorWithThreshold(threshold: 0.02);

    Widget buildNewsArticleGridItemSkeleton() {
      return const TestMaterialApp(
        child: NewsArticleGridItemSkeleton(shimmerLoop: 1),
      );
    }

    final fileNamePrefix =
        'news_article_grid_item_skeleton${Platform.pathSeparator}';

    for (final brightness in Brightness.values) {
      goldenTest(
        '',
        fileName: '$fileNamePrefix${brightness.name}',
        builder: () {
          return GoldenTestWidgetScenario(
            name: '',
            brightness: brightness,
            builder: buildNewsArticleGridItemSkeleton,
          );
        },
      );
    }
  });
}
